`define DDR_ADDR_WIDTH 16

module ComputeDRAM_FSM(
    input   clk,
    input   rst,

    input   vld,
    output  rdy,

    output  cmd_valid,

    // TODO Currently R1 and R2 are row addresses. Bank address fixed to 0.
    // change to use physical address? and translate that into bank-row inside
    // the fsm?
    input [`DDR_ADDR_WIDTH-1:0]    R1,
    input [`DDR_ADDR_WIDTH-1:0]    R2,
    input [3:0]     T1,
    input [3:0]     T2,                  
    
    
    output [`DDR_ADDR_WIDTH-1:0] k7ddrphy_dfi_p0_address    ,
    output [2:0] k7ddrphy_dfi_p0_bank        ,
    output k7ddrphy_dfi_p0_cas_n             ,
    output k7ddrphy_dfi_p0_cs_n              ,
    output k7ddrphy_dfi_p0_ras_n             ,
    output k7ddrphy_dfi_p0_we_n              ,
    output k7ddrphy_dfi_p0_cke               ,
    output k7ddrphy_dfi_p0_odt               ,
    output k7ddrphy_dfi_p0_reset_n           ,
    output [63:0] k7ddrphy_dfi_p0_wrdata     ,
    output [7:0] k7ddrphy_dfi_p0_wrdata_mask ,

    output [`DDR_ADDR_WIDTH-1:0] k7ddrphy_dfi_p1_address    ,
    output [2:0] k7ddrphy_dfi_p1_bank        ,
    output k7ddrphy_dfi_p1_cas_n             ,
    output k7ddrphy_dfi_p1_cs_n              ,
    output k7ddrphy_dfi_p1_ras_n             ,
    output k7ddrphy_dfi_p1_we_n              ,
    output k7ddrphy_dfi_p1_cke               ,
    output k7ddrphy_dfi_p1_odt               ,
    output k7ddrphy_dfi_p1_reset_n           ,
    output [63:0] k7ddrphy_dfi_p1_wrdata     ,
    output [7:0] k7ddrphy_dfi_p1_wrdata_mask ,

    output [`DDR_ADDR_WIDTH-1:0] k7ddrphy_dfi_p2_address    ,
    output [2:0] k7ddrphy_dfi_p2_bank        ,
    output k7ddrphy_dfi_p2_cas_n             ,
    output k7ddrphy_dfi_p2_cs_n              ,
    output k7ddrphy_dfi_p2_ras_n             ,
    output k7ddrphy_dfi_p2_we_n              ,
    output k7ddrphy_dfi_p2_cke               ,
    output k7ddrphy_dfi_p2_odt               ,
    output k7ddrphy_dfi_p2_reset_n           ,
    output [63:0] k7ddrphy_dfi_p2_wrdata     ,
    output [7:0] k7ddrphy_dfi_p2_wrdata_mask ,
    output k7ddrphy_dfi_p2_rddata_en         ,

    output [`DDR_ADDR_WIDTH-1:0] k7ddrphy_dfi_p3_address    ,
    output [2:0] k7ddrphy_dfi_p3_bank        ,
    output k7ddrphy_dfi_p3_cas_n             ,
    output k7ddrphy_dfi_p3_cs_n              ,
    output k7ddrphy_dfi_p3_ras_n             ,
    output k7ddrphy_dfi_p3_we_n              ,
    output k7ddrphy_dfi_p3_cke               ,
    output k7ddrphy_dfi_p3_odt               ,
    output k7ddrphy_dfi_p3_reset_n           ,
    output [63:0] k7ddrphy_dfi_p3_wrdata     ,
    output k7ddrphy_dfi_p3_wrdata_en         ,
    output [7:0] k7ddrphy_dfi_p3_wrdata_mask 

);

    reg [`DDR_ADDR_WIDTH-1:0] k7ddrphy_dfi_p0_address = 15'd0;
    reg [2:0] k7ddrphy_dfi_p0_bank = 3'd0;
    reg k7ddrphy_dfi_p0_cas_n = 1'd1;
    reg k7ddrphy_dfi_p0_cs_n = 1'd0;
    reg k7ddrphy_dfi_p0_ras_n = 1'd1;
    reg k7ddrphy_dfi_p0_we_n = 1'd1;
    reg k7ddrphy_dfi_p0_cke = 1'd1;
    reg k7ddrphy_dfi_p0_odt = 1'd1;
    reg k7ddrphy_dfi_p0_reset_n = 1'd1;
    reg [63:0] k7ddrphy_dfi_p0_wrdata = 64'd0;
    reg [7:0] k7ddrphy_dfi_p0_wrdata_mask = 8'd0;

    reg [`DDR_ADDR_WIDTH-1:0] k7ddrphy_dfi_p1_address = 15'd0;
    reg [2:0] k7ddrphy_dfi_p1_bank = 3'd0;
    reg k7ddrphy_dfi_p1_cas_n = 1'd1;
    reg k7ddrphy_dfi_p1_cs_n = 1'd0;
    reg k7ddrphy_dfi_p1_ras_n = 1'd1;
    reg k7ddrphy_dfi_p1_we_n = 1'd1;
    reg k7ddrphy_dfi_p1_cke = 1'd1;
    reg k7ddrphy_dfi_p1_odt = 1'd1;
    reg k7ddrphy_dfi_p1_reset_n = 1'd1;
    reg [63:0] k7ddrphy_dfi_p1_wrdata = 64'd0;
    reg [7:0] k7ddrphy_dfi_p1_wrdata_mask = 8'd0;
    
    reg [`DDR_ADDR_WIDTH-1:0] k7ddrphy_dfi_p2_address = 15'd0;
    reg [2:0] k7ddrphy_dfi_p2_bank = 3'd0;
    reg k7ddrphy_dfi_p2_cas_n = 1'd1;
    reg k7ddrphy_dfi_p2_cs_n = 1'd0;
    reg k7ddrphy_dfi_p2_ras_n = 1'd1;
    reg k7ddrphy_dfi_p2_we_n = 1'd1;
    reg k7ddrphy_dfi_p2_cke = 1'd1;
    reg k7ddrphy_dfi_p2_odt = 1'd1;
    reg k7ddrphy_dfi_p2_reset_n = 1'd1;
    reg [63:0] k7ddrphy_dfi_p2_wrdata = 64'd0;
    reg [7:0] k7ddrphy_dfi_p2_wrdata_mask = 8'd0;
    reg k7ddrphy_dfi_p2_rddata_en = 1'd0;
    
    reg [`DDR_ADDR_WIDTH-1:0] k7ddrphy_dfi_p3_address = 15'd0;
    reg [2:0] k7ddrphy_dfi_p3_bank = 3'd0;
    reg k7ddrphy_dfi_p3_cas_n = 1'd1;
    reg k7ddrphy_dfi_p3_cs_n = 1'd0;
    reg k7ddrphy_dfi_p3_ras_n = 1'd1;
    reg k7ddrphy_dfi_p3_we_n = 1'd1;
    reg k7ddrphy_dfi_p3_cke = 1'd1;
    reg k7ddrphy_dfi_p3_odt = 1'd1;
    reg k7ddrphy_dfi_p3_reset_n = 1'd1;
    reg [63:0] k7ddrphy_dfi_p3_wrdata = 64'd0;
    reg k7ddrphy_dfi_p3_wrdata_en = 1'd0;
    reg [7:0] k7ddrphy_dfi_p3_wrdata_mask = 8'd0;

    reg [3:0]  T1_r;
    reg [3:0]  T2_r;

    reg [143:0]     instr, instr_r;
    reg [`DDR_ADDR_WIDTH-1:0] addr_queue [15:0];

    // Each 4 bits represent a command 
    // 0 - wait
    // 1 - Activate
    // 2 - Precharge
    // 3 - stop
    always @(*) begin
        // This sequence is: PRE - wait(5) - ACT(R1) - wait(T1) - PRE - wait(T2) - ACT(R2) - wait(5) - PRE
        instr = 144'h1000002 | (144'h2 << (28+T1*4)) | (144'h2000001 << (32+T1*4+T2*4)) | (144'h3333_3333_3333_3333_3333_3333 << (60+T1*4+T2*4));
    end

    localparam list_cas_n   = 4'b 1111;
    localparam list_ras_n   = 4'b 1001;
    localparam list_we_n    = 4'b 1011;

    localparam IDLE     = 0;
    localparam ISSUE    = 1;

    reg [1:0] ACTs_before [3:0];

    (* mark_debug="true" *)reg  state;
    reg [5:0] index;
    reg [3:0] addr_index; // Accept at most 16 ACT commands

    //wire [3:0] debug_probe = instr[(index+3)*4+:4];
    assign rdy = (state == IDLE);
    assign cmd_valid = (state == ISSUE);

    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            instr_r <= 0;
        end
        else if (state == IDLE && rdy && vld) begin
            state <= ISSUE;
            instr_r <= instr;
            addr_queue[0] <= R1;
            addr_queue[1] <= R2;
        end
        else if (state == ISSUE && instr_r[(index+3)*4+:4]==4'h3) begin
            state <= IDLE;
            instr_r <= 0;
        end
    end

    always @(posedge clk) begin
        if (rst || state == IDLE) begin
            index <= 0;
            addr_index <= 0;
        end
        else if(state == ISSUE) begin
            index <= index + 4;
            addr_index <= addr_index + ACTs_before[3];
        end
    end

    always @(*) begin
        ACTs_before[0] = (instr_r[(index)*4+:4] == 4'h1) ? 2'd1 : 2'd0;                        
        ACTs_before[1] = (instr_r[(index+1)*4+:4] == 4'h1) ? ACTs_before[0]+1 : ACTs_before[0];
        ACTs_before[2] = (instr_r[(index+2)*4+:4] == 4'h1) ? ACTs_before[1]+1 : ACTs_before[1];
        ACTs_before[3] = (instr_r[(index+3)*4+:4] == 4'h1) ? ACTs_before[2]+1 : ACTs_before[2];
    end

    always @(*) begin
        if (state == IDLE) begin
            k7ddrphy_dfi_p0_cas_n = list_cas_n[0]; 
            k7ddrphy_dfi_p1_cas_n = list_cas_n[0];
            k7ddrphy_dfi_p2_cas_n = list_cas_n[0];
            k7ddrphy_dfi_p3_cas_n = list_cas_n[0];
            k7ddrphy_dfi_p0_ras_n = list_ras_n[0];
            k7ddrphy_dfi_p1_ras_n = list_ras_n[0];
            k7ddrphy_dfi_p2_ras_n = list_ras_n[0];
            k7ddrphy_dfi_p3_ras_n = list_ras_n[0];
            k7ddrphy_dfi_p0_we_n  = list_we_n[0];
            k7ddrphy_dfi_p1_we_n  = list_we_n[0];
            k7ddrphy_dfi_p2_we_n  = list_we_n[0];
            k7ddrphy_dfi_p3_we_n  = list_we_n[0];

            k7ddrphy_dfi_p0_address     = 0; 
            k7ddrphy_dfi_p1_address     = 0;
            k7ddrphy_dfi_p2_address     = 0;
            k7ddrphy_dfi_p3_address     = 0;

        end
        else if (state == ISSUE) begin
            k7ddrphy_dfi_p0_cas_n = list_cas_n[instr_r[(index)*4+:2]];
            k7ddrphy_dfi_p1_cas_n = list_cas_n[instr_r[(index+1)*4+:2]];
            k7ddrphy_dfi_p2_cas_n = list_cas_n[instr_r[(index+2)*4+:2]];
            k7ddrphy_dfi_p3_cas_n = list_cas_n[instr_r[(index+3)*4+:2]];
            k7ddrphy_dfi_p0_ras_n = list_ras_n[instr_r[(index)*4+:2]];
            k7ddrphy_dfi_p1_ras_n = list_ras_n[instr_r[(index+1)*4+:2]];
            k7ddrphy_dfi_p2_ras_n = list_ras_n[instr_r[(index+2)*4+:2]];
            k7ddrphy_dfi_p3_ras_n = list_ras_n[instr_r[(index+3)*4+:2]];
            k7ddrphy_dfi_p0_we_n  = list_we_n[instr_r[(index)*4+:2]];
            k7ddrphy_dfi_p1_we_n  = list_we_n[instr_r[(index+1)*4+:2]];
            k7ddrphy_dfi_p2_we_n  = list_we_n[instr_r[(index+2)*4+:2]];
            k7ddrphy_dfi_p3_we_n  = list_we_n[instr_r[(index+3)*4+:2]];

            k7ddrphy_dfi_p0_address     = (instr_r[(index)*4+:4] == 4'h1) ? addr_queue[addr_index] : 0;
            k7ddrphy_dfi_p1_address     = (instr_r[(index+1)*4+:4] == 4'h1) ? addr_queue[addr_index+ACTs_before[0]] : 0;
            k7ddrphy_dfi_p2_address     = (instr_r[(index+2)*4+:4] == 4'h1) ? addr_queue[addr_index+ACTs_before[1]] : 0;
            k7ddrphy_dfi_p3_address     = (instr_r[(index+3)*4+:4] == 4'h1) ? addr_queue[addr_index+ACTs_before[2]] : 0;
        end
    end

endmodule
