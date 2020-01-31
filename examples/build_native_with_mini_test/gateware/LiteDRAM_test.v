module LiteDRAM_test(
    output        serial_tx,                 
    input         serial_rx,             
    input         clk200_n,                   
    input         clk200_p,                   
    input         cpu_reset_n,                   

    // DDR 
    output [14:0] ddram_a,               
    output [2:0]  ddram_ba,              
    output        ddram_ras_n,           
    output        ddram_cas_n,           
    output        ddram_we_n,           
    output        ddram_cs_n,            
    output [3:0]  ddram_dm,              
    inout [31:0]  ddram_dq,              
    output [3:0]  ddram_dqs_p,           
    output [3:0]  ddram_dqs_n,           
    output        ddram_clk_p,           
    output        ddram_clk_n,           
    output        ddram_cke,             
    output        ddram_odt,             
    output        ddram_reset_n,

    output reg [7:0] led,
    input           start_read,
    input           start_write,
    input           home,
    input           next,
    input           prev

    //output        user_clk,              
    //output        user_rst,              
    /*
    input         user_port0_cmd_valid  
    output        user_port0_cmd_ready  
    input         user_port0_cmd_we     
    input [24:0]  user_port0_cmd_addr   
    input         user_port0_wdata_valid
    output        user_port0_wdata_ready
    input [31:0]  user_port0_wdata_we   
    input [255:0] user_port0_wdata_data 
    output        user_port0_rdata_valid
    input         user_port0_rdata_ready
    output [255:0]user_port0_rdata_data*/ 
);

    wire    start_read_db;
    wire    start_write_db;
    wire    home_db;
    wire    next_db;
    wire    prev_db;
    wire    user_clk;
    wire    user_rst;

    debounce start_read_db(
        .reset          (user_rst),
        .clk            (user_clk),
        .raw_signal     (start_read),

        .debounced      (start_read_db)
    );
    debounce start_write_db(
        .reset          (user_rst),
        .clk            (user_clk),
        .raw_signal     (start_write),

        .debounced      (start_write_db)
    );
    debounce home_db(
        .reset          (user_rst),
        .clk            (user_clk),
        .raw_signal     (home),

        .debounced      (home_db)
    );
    debounce next_db(
        .reset          (user_rst),
        .clk            (user_clk),
        .raw_signal     (next),

        .debounced      (next_db)
    );
    debounce prev_db(
        .reset          (user_rst),
        .clk            (user_clk),
        .raw_signal     (prev),

        .debounced      (prev_db)
    );

    reg          cmd_valid  ;  
    wire         cmd_ready  ;
    reg          cmd_we     ;
    reg[24:0]    cmd_addr, rd_addr, wr_addr;
    reg          wdata_valid;
    wire         wdata_ready;
    reg [31:0]   wdata_we   ;
    wire[255:0]  wdata_data ;
    wire         rdata_valid;
    reg          rdata_ready; 
    wire [255:0] rdata_data ; 

    wire    pll_locked;
    wire    init_done;
    wire    init_error;

    // assign cmd_addr = 25'h000_0000;
    assign wdata_data = {240'hffff_eeee_dddd_cccc_bbbb_aaaa_9999_8888_7777_6666_5555_4444_3333_2222_1111, wr_addr[15:0]}; 
       
    wire always_0 = 1'b0;
    wire always_1 = 1'b1;


    localparam  IDLE = 0;
    localparam  READOUT = 2'd1;
    localparam  WRITE = 2'd2;
    localparam  SENDCMD = 2'd1;
    localparam  READRDY = 2'd2;
    localparam  FINISHED = 2'd3;

    reg  [1:0]  state;
    reg  [1:0]  read_state;
    reg  [1:0]  write_state;
    reg  [1:0]  state_next;
    reg  [1:0]  read_state_next;
    reg  [1:0]  write_state_next;
    wire [1:0]  counter_state;
    reg  [3:0]  read_out_data;
    reg  [255:0] rdata_buf;

    reg [1:0] addr_botton; // Use to distinguish the state of holding the botton with releasing the botton
    always @(posedge user_clk) begin
        if (user_rst) begin
            rd_addr <= 25'h0;
            wr_addr <= 25'h0;
            addr_botton <= 2'd0;
        end
        else if (state == IDLE) begin
            addr_botton <= 0;
        end
        else if (state == READOUT && start_read_db && addr_botton == 0) begin 
            addr_botton <= 2'd1;
        end
        else if (state == READOUT && ~start_read_db && addr_botton == 2'd1) begin 
            addr_botton <= 2'd2;
        end
        else if (state == READOUT && start_read_db && addr_botton == 2'd2) begin 
            addr_botton <= 2'd1;
            rd_addr <= (rd_addr + 1) & 8'h07;
        end

        else if (state == WRITE && start_write_db && addr_botton == 0) begin
            addr_botton <= 2'd1;
        end
        else if (state == WRITE && ~start_write_db && addr_botton == 2'd1) begin
            addr_botton <= 2'd2;
        end
        else if (state == WRITE && start_write_db && addr_botton == 2'd2) begin
            addr_botton <= 2'd1;
            wr_addr <= (wr_addr + 1) & 8'h07;
        end
    end

    always @(*) begin
        if (state == IDLE && start_read_db) begin
            state_next = READOUT; 
        end
        else if (state == IDLE && start_write_db) begin
            state_next = WRITE;
        end
        else if (home_db) begin
            state_next = IDLE;
        end
        else begin
            state_next = state;
        end
    end

    always @(*) begin
        read_state_next = read_state;
        if (read_state == IDLE && state == READOUT) begin
            read_state_next = SENDCMD; 
        end
        else if (read_state == SENDCMD && cmd_valid && cmd_ready) begin
            read_state_next = READRDY;
        end
        else if (read_state == READRDY && rdata_valid && rdata_ready) begin
            read_state_next = FINISHED;
        end
        else if (read_state == FINISHED && state == IDLE) begin
            read_state_next = IDLE;
        end
    end

    always @(*) begin
        write_state_next = write_state;
        if (write_state == IDLE && state == WRITE) begin
            write_state_next = SENDCMD; 
        end
        else if (write_state == SENDCMD && wdata_valid && wdata_ready && cmd_valid && cmd_ready && cmd_we) begin
            write_state_next = FINISHED;
        end
        else if (write_state == FINISHED && state == IDLE) begin
            write_state_next = IDLE;
        end
    end

    // control signals
    always @(*) begin
        cmd_valid = 0;
        cmd_we = 0;
        wdata_valid = 0;
        wdata_we = 32'd0;
        rdata_ready = 0;
        if (state == READOUT && read_state == SENDCMD) begin
            cmd_valid = 1;
            cmd_we = 0;
            cmd_addr = rd_addr;
            wdata_valid = 0;
            wdata_we = 32'd0;
            rdata_ready = 0;
        end
        else if (state == READOUT && read_state == READRDY) begin
            cmd_valid = 0;
            cmd_we = 0;
            cmd_addr = 0;
            wdata_valid = 0;
            wdata_we = 32'd0;
            rdata_ready = 1;
        end
        else if (state == WRITE && write_state == SENDCMD) begin
            cmd_valid = 1;
            cmd_we = 1;
            cmd_addr = wr_addr;
            wdata_valid = 1;
            wdata_we = 32'hffff_ffff;
            rdata_ready = 0;
        end
    end

    // led display
    always @(*) begin
        led[7:0] = 0;
        //led[1:0] = state;
        case(state)
            IDLE: begin
                led[0] = cmd_ready;
                led[1] = wdata_ready;
                led[7] = init_done;
                led[6] = init_error;
                led[5] = pll_locked;

                led[4:2] = 3'd7;
            end
            READOUT: begin
                led[0]   = (read_state == FINISHED) & (counter_state[0]);
                led[3:1] = rd_addr[2:0];
                led[7:4] = read_out_data;
            end
            WRITE: begin
                led[1:0] = write_state;
                led[4:2] = wr_addr[2:0];
                led[7:5] = 3'b111;
            end
        endcase
    end

    reg [5:0]   counter;
    reg         botton;
    always @(posedge user_clk) begin
        if (user_rst || state != READOUT) begin
            counter <= 0;
            botton <= 0;
        end
        else if (!botton && next_db) begin
            botton <= 1;
            counter <= counter + 1;
        end
        else if (!botton && prev_db) begin
            botton <= 1;
            counter <= counter - 1;
        end
        else if (botton && !next_db && !prev_db) begin
            botton <= 0;
        end
    end

    assign counter_state[1] = (state == READOUT);
    assign counter_state[0] = (counter == 0);
    always @(*) begin
        read_out_data = rdata_buf[ 4*counter +: 4];
    end

    always @(posedge user_clk) begin
        if (user_rst) begin
            state <= IDLE;
            read_state <= IDLE;
            write_state <= IDLE;
        end
        else begin
            state <= state_next;
            read_state <= read_state_next;
            write_state <= write_state_next;
        end
    end

    always @(posedge user_clk) begin
        if (user_rst) begin
            rdata_buf <= 0;
        end
        else if (rdata_valid && rdata_ready) begin
            rdata_buf <= rdata_data;
        end
    end

    litedram_core litedram_core_impl(
	.serial_tx                (serial_tx),           
	.serial_rx                (serial_rx),
	.clk200_p                 (clk200_p),
	.clk200_n                 (clk200_n),
	.cpu_reset_n              (cpu_reset_n),
	.pll_locked               (pll_locked),
	.ddram_a                  (ddram_a),
	.ddram_ba                 (ddram_ba),
	.ddram_ras_n              (ddram_ras_n),
	.ddram_cas_n              (ddram_cas_n),
	.ddram_we_n               (ddram_we_n),
	.ddram_cs_n               (ddram_cs_n),
	.ddram_dm                 (ddram_dm),
	.ddram_dq                 (ddram_dq),
	.ddram_dqs_p              (ddram_dqs_p),
	.ddram_dqs_n              (ddram_dqs_n),
	.ddram_clk_p              (ddram_clk_p),
	.ddram_clk_n              (ddram_clk_n),
	.ddram_cke                (ddram_cke),
	.ddram_odt                (ddram_odt),
	.ddram_reset_n            (ddram_reset_n),
	.init_done                (init_done),
	.init_error               (init_error),
	.user_clk                 (user_clk),
	.user_rst                 (user_rst),
	.user_port0_cmd_valid     (cmd_valid),
	.user_port0_cmd_ready     (cmd_ready),
	.user_port0_cmd_we        (cmd_we),
	.user_port0_cmd_addr      (cmd_addr),
	.user_port0_wdata_valid   (wdata_valid),
	.user_port0_wdata_ready   (wdata_ready),
	.user_port0_wdata_we      (wdata_we),
	.user_port0_wdata_data    (wdata_data),
	.user_port0_rdata_valid   (rdata_valid),
	.user_port0_rdata_ready   (rdata_ready),
	.user_port0_rdata_data    (rdata_data)
    );

endmodule

`define CNT_SIZE_WID 20
module debounce (
        input           reset,
        input           clk,
        input           raw_signal,

        output reg      debounced
);

        reg [1:0]               queue;
        reg [`CNT_SIZE_WID-1:0] cnt;
        wire                    reset_cnt = queue[0] ^ queue[1];

        always @(posedge clk) begin
                queue[0] <= raw_signal;
                queue[1] <= queue[0];
        end

        always @(posedge clk) begin
                if (reset || reset_cnt)
                        cnt <= 0;
                else if (cnt[`CNT_SIZE_WID-1] == 1'b0)
                        cnt <= cnt + 1'b1;
                else begin
                        cnt <= 0;
                        debounced <= queue[1];
                end
        end

endmodule

