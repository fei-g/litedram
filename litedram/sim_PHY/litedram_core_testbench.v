module litedram_core_testbench();
   
    reg clk200_n, clk200_p, cpu_reset;

    initial begin
        clk200_n = 0;
        clk200_p = 1;
        cpu_reset = 0;

        #10
        cpu_reset = 1;

        #30
        cpu_reset = 0;


    end
    always begin
        #5 
        clk200_n = ~clk200_n;
        clk200_p = ~clk200_p;
    end

    wire serial_tx;
    reg  serial_rx = 0;

    wire [15:0] ddram_a;
    wire [2:0] ddram_ba;
    wire ddram_ras_n;
    wire ddram_cas_n;
    wire ddram_we_n;
    wire ddram_cs_n;
    wire [3:0] ddram_dm;
    wire [31:0] ddram_dq = 32'bz;
    wire [3:0] ddram_dqs_p;
    wire [3:0] ddram_dqs_n;
    wire ddram_clk_p;
    wire ddram_clk_n;
    wire ddram_cke;
    wire ddram_odt;
    wire ddram_reset_n;

    reg user_port_native_0_cmd_valid            = 0;
    wire user_port_native_0_cmd_ready           ;
    reg user_port_native_0_cmd_we               = 0;
    reg [23:0] user_port_native_0_cmd_addr      = 0;
    reg [23:0] write_addr      = 0;
    reg user_port_native_0_wdata_valid          = 0;
    wire user_port_native_0_wdata_ready         ;
    reg [31:0] user_port_native_0_wdata_we      = 0;
    reg [255:0] user_port_native_0_wdata_data   = 0;
    reg [255:0] write_data   = 0;
    wire user_port_native_0_rdata_valid         ;
    reg user_port_native_0_rdata_ready          = 0;
    wire [255:0] user_port_native_0_rdata_data  ;
    
    wire    pll_locked;
    wire    init_done;
    wire    init_error;

    wire    user_clk;
    wire    user_rst;

    reg [15:0] ComputeDRAM_R1;
    reg [15:0] ComputeDRAM_R2;
    reg [3:0] ComputeDRAM_T1;
    reg [3:0] ComputeDRAM_T2;
    reg ComputeDRAM_vld;
    wire ComputeDRAM_rdy;

    reg start_write = 0;

    initial begin
        ComputeDRAM_R1  = 0;
        ComputeDRAM_R2  = 0;
        ComputeDRAM_T1  = 0;
        ComputeDRAM_T2  = 0;
        ComputeDRAM_vld = 0;

        #1001
        ComputeDRAM_R1  = 4;
        ComputeDRAM_R2  = 5;
        ComputeDRAM_T1  = 2;
        ComputeDRAM_T2  = 2;
        ComputeDRAM_vld = 1;

        #19
        ComputeDRAM_R1  = 0;
        ComputeDRAM_R2  = 0;
        ComputeDRAM_T1  = 0;
        ComputeDRAM_T2  = 0;
        ComputeDRAM_vld = 0;

        #16
        start_write = 1;
        write_addr = 24'h 00_0000;
        write_data = 256'h 1111_2222_3333_4444_5555_6666_7777_8888_9999_aaaa_bbbb_cccc_dddd_eeee_ffff_0000;

        #16
        start_write = 0;
        
        #640
        start_write = 1;
        write_addr = 24'h 00_0008;
        write_data = 256'h 1111_2222_3333_4444_5555_6666_7777_8888_9999_aaaa_bbbb_cccc_dddd_eeee_ffff_0101;

        #16
        start_write = 0;
        
        #640
        start_write = 1;
        write_addr = 24'h 00_00f0;
        write_data = 256'h 1111_2222_3333_4444_5555_6666_7777_8888_9999_aaaa_bbbb_cccc_dddd_eeee_ffff_1212;

        #16
        start_write = 0;
        
        #640
        start_write = 1;
        write_addr = 24'h 00_0781;
        write_data = 256'h 1111_2222_3333_4444_5555_6666_7777_8888_9999_aaaa_bbbb_cccc_dddd_eeee_ffff_2323;

        #16
        start_write = 0;
        
        #640
        start_write = 1;
        write_addr = 24'h 00_0701;
        write_data = 256'h 1111_2222_3333_4444_5555_6666_7777_8888_9999_aaaa_bbbb_cccc_dddd_eeee_ffff_3434;

        #16
        start_write = 0;
    end

    reg [1:0] state;
    localparam IDLE = 0;
    localparam WRITE = 1;
    localparam WAIT = 2;
    always @(posedge user_clk) begin
        if (user_rst) begin
            state = IDLE;
        end
        else if (start_write && state == IDLE) begin
            state <= WRITE;
            user_port_native_0_cmd_addr     <= write_addr;
            user_port_native_0_wdata_data   <= write_data;
        end
        else if (state == WRITE && user_port_native_0_cmd_valid && 
        user_port_native_0_cmd_ready && user_port_native_0_wdata_valid &&
        user_port_native_0_wdata_ready) begin
            state <= IDLE;
        end
        else if (state == WRITE && user_port_native_0_cmd_valid && 
        user_port_native_0_cmd_ready) begin
            state <= WAIT;
        end
        else if (state == WAIT && user_port_native_0_wdata_valid &&
        user_port_native_0_wdata_ready) begin
            state <= IDLE;
        end
    end

    always @(*) begin
        if (state == IDLE) begin
            user_port_native_0_cmd_valid    = 0;
            user_port_native_0_cmd_we       = 0;
            user_port_native_0_wdata_valid  = 0;
            user_port_native_0_wdata_we     = 32'h ffff_ffff; 
        end
        else if (state == WRITE) begin
            user_port_native_0_cmd_valid    = 1;
            user_port_native_0_cmd_we       = 1;
            user_port_native_0_wdata_valid  = 1;
            user_port_native_0_wdata_we     = 32'h ffff_ffff; 
        end
        else if (state == WAIT) begin
            user_port_native_0_cmd_valid    = 0;
            user_port_native_0_cmd_we       = 1;
            user_port_native_0_wdata_valid  = 1;
            user_port_native_0_wdata_we     = 32'h ffff_ffff; 
        end
    end
    
    litedram_core core(
	.serial_rx                           (serial_rx                      ),       
	.serial_tx                           (serial_tx                      ),               
	.clk200_p                            (clk200_p                       ),               
	.clk200_n                            (clk200_n                       ),                   
	.cpu_reset                           (cpu_reset                      ),               
	.pll_locked                          (pll_locked                     ),       
	.ddram_a                             (ddram_a                        ),           
	.ddram_ba                            (ddram_ba                       ),               
	.ddram_ras_n                         (ddram_ras_n                    ),                               
	.ddram_cas_n                         (ddram_cas_n                    ),                           
	.ddram_we_n                          (ddram_we_n                     ),               
	.ddram_cs_n                          (ddram_cs_n                     ),                                           
	.ddram_dm                            (ddram_dm                       ),                       
	.ddram_dq                            (ddram_dq                       ),               
	.ddram_dqs_p                         (ddram_dqs_p                    ),           
	.ddram_dqs_n                         (ddram_dqs_n                    ),           
	.ddram_clk_p                         (ddram_clk_p                    ),           
	.ddram_clk_n                         (ddram_clk_n                    ),       
	.ddram_cke                           (ddram_cke                      ),               
	.ddram_odt                           (ddram_odt                      ),       
	.ddram_reset_n                       (ddram_reset_n                  ),               
	.init_done                           (init_done                      ),           
	.init_error                          (init_error                     ),                               
	.user_clk                            (user_clk                       ),           
	.user_rst                            (user_rst                       ),   
	.user_port_native_0_cmd_valid        (user_port_native_0_cmd_valid   ),   
	.user_port_native_0_cmd_ready        (user_port_native_0_cmd_ready   ),   
	.user_port_native_0_cmd_we           (user_port_native_0_cmd_we      ),   
	.user_port_native_0_cmd_addr         (user_port_native_0_cmd_addr    ),   
	.user_port_native_0_wdata_valid      (user_port_native_0_wdata_valid ),   
	.user_port_native_0_wdata_ready      (user_port_native_0_wdata_ready ),   
	.user_port_native_0_wdata_we         (user_port_native_0_wdata_we    ),   
	.user_port_native_0_wdata_data       (user_port_native_0_wdata_data  ), 
	.user_port_native_0_rdata_valid      (user_port_native_0_rdata_valid ),   
	.user_port_native_0_rdata_ready      (user_port_native_0_rdata_ready ),   
	.user_port_native_0_rdata_data       (user_port_native_0_rdata_data  ),

	.ComputeDRAM_R1                      (ComputeDRAM_R1 ),
	.ComputeDRAM_R2                      (ComputeDRAM_R2 ),
	.ComputeDRAM_T1                      (ComputeDRAM_T1 ),
	.ComputeDRAM_T2                      (ComputeDRAM_T2 ),
	.ComputeDRAM_vld                     (ComputeDRAM_vld),
	.ComputeDRAM_rdy                     (ComputeDRAM_rdy)
    );

endmodule
