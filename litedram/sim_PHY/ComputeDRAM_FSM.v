`define DDR_ADDR_WIDTH 15

module FSM_test();
    reg vld;
    wire rdy, cmd_valid;
    reg [`DDR_ADDR_WIDTH-1:0]    R1;
    reg [`DDR_ADDR_WIDTH-1:0]    R2;
    reg [3:0]     T1;
    reg [3:0]     T2;                  

    reg sys_clk, sys_rst;
    reg sys4x_clk, sys4x_rst;

    initial begin
        sys_clk = 0;
        sys_rst = 0;
        sys4x_clk = 0;
        sys4x_rst = 0;

        #10 
        sys_rst = 1;
        sys4x_rst = 1;

        #100
        sys_rst = 0;
        sys4x_rst = 0;
        
        #59
        vld = 1;
        R1 = 4;
        R2 = 3;
        T1 = 2;
        T2 = 2;
        #16
        vld = 0;
        R1 = 0;
        R2 = 0;
        T1 = 0;
        T2 = 0;
    end

    always begin
        #2 sys4x_clk = ~sys4x_clk;
    end
    always begin
        #8 sys_clk = ~sys_clk;
    end

    wire [14:0] k7ddrphy_dfi_p0_address    ;
    wire [2:0] k7ddrphy_dfi_p0_bank        ;
    wire k7ddrphy_dfi_p0_cas_n             ;
    wire k7ddrphy_dfi_p0_cs_n              ;
    wire k7ddrphy_dfi_p0_ras_n             ;
    wire k7ddrphy_dfi_p0_we_n              ;
    wire k7ddrphy_dfi_p0_cke               ;
    wire k7ddrphy_dfi_p0_odt               ;
    wire k7ddrphy_dfi_p0_reset_n           ;
    wire [63:0] k7ddrphy_dfi_p0_wrdata     ;
    wire [7:0] k7ddrphy_dfi_p0_wrdata_mask ;
    wire [63:0] k7ddrphy_dfi_p0_rddata     ;
    wire k7ddrphy_dfi_p0_rddata_valid      ;
    wire [14:0] k7ddrphy_dfi_p1_address    ;
    wire [2:0] k7ddrphy_dfi_p1_bank        ;
    wire k7ddrphy_dfi_p1_cas_n             ;
    wire k7ddrphy_dfi_p1_cs_n              ;
    wire k7ddrphy_dfi_p1_ras_n             ;
    wire k7ddrphy_dfi_p1_we_n              ;
    wire k7ddrphy_dfi_p1_cke               ;
    wire k7ddrphy_dfi_p1_odt               ;
    wire k7ddrphy_dfi_p1_reset_n           ;
    wire [63:0] k7ddrphy_dfi_p1_wrdata     ;
    wire [7:0] k7ddrphy_dfi_p1_wrdata_mask ;
    wire [63:0] k7ddrphy_dfi_p1_rddata     ;
    wire k7ddrphy_dfi_p1_rddata_valid      ;
    wire [14:0] k7ddrphy_dfi_p2_address    ;
    wire [2:0] k7ddrphy_dfi_p2_bank        ;
    wire k7ddrphy_dfi_p2_cas_n             ;
    wire k7ddrphy_dfi_p2_cs_n              ;
    wire k7ddrphy_dfi_p2_ras_n             ;
    wire k7ddrphy_dfi_p2_we_n              ;
    wire k7ddrphy_dfi_p2_cke               ;
    wire k7ddrphy_dfi_p2_odt               ;
    wire k7ddrphy_dfi_p2_reset_n           ;
    wire [63:0] k7ddrphy_dfi_p2_wrdata     ;
    wire [7:0] k7ddrphy_dfi_p2_wrdata_mask ;
    wire k7ddrphy_dfi_p2_rddata_en         ;
    wire [63:0] k7ddrphy_dfi_p2_rddata     ;
    wire k7ddrphy_dfi_p2_rddata_valid      ;
    wire [14:0] k7ddrphy_dfi_p3_address    ;
    wire [2:0] k7ddrphy_dfi_p3_bank        ;
    wire k7ddrphy_dfi_p3_cas_n             ;
    wire k7ddrphy_dfi_p3_cs_n              ;
    wire k7ddrphy_dfi_p3_ras_n             ;
    wire k7ddrphy_dfi_p3_we_n              ;
    wire k7ddrphy_dfi_p3_cke               ;
    wire k7ddrphy_dfi_p3_odt               ;
    wire k7ddrphy_dfi_p3_reset_n           ;
    wire [63:0] k7ddrphy_dfi_p3_wrdata     ;
    wire k7ddrphy_dfi_p3_wrdata_en         ;
    wire [7:0] k7ddrphy_dfi_p3_wrdata_mask ;
    wire [63:0] k7ddrphy_dfi_p3_rddata     ;
    wire k7ddrphy_dfi_p3_rddata_valid      ;


    ComputeDRAM_FSM fsm(
        .clk    (sys_clk),
        .rst    (sys_rst),

        .vld    (vld),
        .rdy    (rdy),

        .R1     (R1),
        .R2     (R2),
        .T1     (T1),
        .T2     (T2),

        .cmd_valid  (cmd_valid),

        .k7ddrphy_dfi_p0_address           (k7ddrphy_dfi_p0_address     ),
        .k7ddrphy_dfi_p0_bank              (k7ddrphy_dfi_p0_bank        ),
        .k7ddrphy_dfi_p0_cas_n             (k7ddrphy_dfi_p0_cas_n       ),
        .k7ddrphy_dfi_p0_cs_n              (k7ddrphy_dfi_p0_cs_n        ),
        .k7ddrphy_dfi_p0_ras_n             (k7ddrphy_dfi_p0_ras_n       ),
        .k7ddrphy_dfi_p0_we_n              (k7ddrphy_dfi_p0_we_n        ),
        .k7ddrphy_dfi_p0_cke               (k7ddrphy_dfi_p0_cke         ),
        .k7ddrphy_dfi_p0_odt               (k7ddrphy_dfi_p0_odt         ),
        .k7ddrphy_dfi_p0_reset_n           (k7ddrphy_dfi_p0_reset_n     ),
        .k7ddrphy_dfi_p0_wrdata            (k7ddrphy_dfi_p0_wrdata      ),
        .k7ddrphy_dfi_p0_wrdata_mask       (k7ddrphy_dfi_p0_wrdata_mask ),

        .k7ddrphy_dfi_p1_address           (k7ddrphy_dfi_p1_address     ),
        .k7ddrphy_dfi_p1_bank              (k7ddrphy_dfi_p1_bank        ),
        .k7ddrphy_dfi_p1_cas_n             (k7ddrphy_dfi_p1_cas_n       ),
        .k7ddrphy_dfi_p1_cs_n              (k7ddrphy_dfi_p1_cs_n        ),
        .k7ddrphy_dfi_p1_ras_n             (k7ddrphy_dfi_p1_ras_n       ),
        .k7ddrphy_dfi_p1_we_n              (k7ddrphy_dfi_p1_we_n        ),
        .k7ddrphy_dfi_p1_cke               (k7ddrphy_dfi_p1_cke         ),
        .k7ddrphy_dfi_p1_odt               (k7ddrphy_dfi_p1_odt         ),
        .k7ddrphy_dfi_p1_reset_n           (k7ddrphy_dfi_p1_reset_n     ),
        .k7ddrphy_dfi_p1_wrdata            (k7ddrphy_dfi_p1_wrdata      ),
        .k7ddrphy_dfi_p1_wrdata_mask       (k7ddrphy_dfi_p1_wrdata_mask ),

        .k7ddrphy_dfi_p2_address           (k7ddrphy_dfi_p2_address     ),
        .k7ddrphy_dfi_p2_bank              (k7ddrphy_dfi_p2_bank        ),
        .k7ddrphy_dfi_p2_cas_n             (k7ddrphy_dfi_p2_cas_n       ),
        .k7ddrphy_dfi_p2_cs_n              (k7ddrphy_dfi_p2_cs_n        ),
        .k7ddrphy_dfi_p2_ras_n             (k7ddrphy_dfi_p2_ras_n       ),
        .k7ddrphy_dfi_p2_we_n              (k7ddrphy_dfi_p2_we_n        ),
        .k7ddrphy_dfi_p2_cke               (k7ddrphy_dfi_p2_cke         ),
        .k7ddrphy_dfi_p2_odt               (k7ddrphy_dfi_p2_odt         ),
        .k7ddrphy_dfi_p2_reset_n           (k7ddrphy_dfi_p2_reset_n     ),
        .k7ddrphy_dfi_p2_wrdata            (k7ddrphy_dfi_p2_wrdata      ),
        .k7ddrphy_dfi_p2_wrdata_mask       (k7ddrphy_dfi_p2_wrdata_mask ),
        .k7ddrphy_dfi_p2_rddata_en         (k7ddrphy_dfi_p2_rddata_en   ),

        .k7ddrphy_dfi_p3_address           (k7ddrphy_dfi_p3_address     ),
        .k7ddrphy_dfi_p3_bank              (k7ddrphy_dfi_p3_bank        ),
        .k7ddrphy_dfi_p3_cas_n             (k7ddrphy_dfi_p3_cas_n       ),
        .k7ddrphy_dfi_p3_cs_n              (k7ddrphy_dfi_p3_cs_n        ),
        .k7ddrphy_dfi_p3_ras_n             (k7ddrphy_dfi_p3_ras_n       ),
        .k7ddrphy_dfi_p3_we_n              (k7ddrphy_dfi_p3_we_n        ),
        .k7ddrphy_dfi_p3_cke               (k7ddrphy_dfi_p3_cke         ),
        .k7ddrphy_dfi_p3_odt               (k7ddrphy_dfi_p3_odt         ),
        .k7ddrphy_dfi_p3_reset_n           (k7ddrphy_dfi_p3_reset_n     ),
        .k7ddrphy_dfi_p3_wrdata            (k7ddrphy_dfi_p3_wrdata      ),
        .k7ddrphy_dfi_p3_wrdata_en         (k7ddrphy_dfi_p3_wrdata_en   ),
        .k7ddrphy_dfi_p3_wrdata_mask       (k7ddrphy_dfi_p3_wrdata_mask )
    
    );

    wire [14:0] ddram_a;
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


    DDRPHY phy_instance(
    	.sys_clk                (sys_clk),
    	.sys_rst                (sys_rst),
    	.sys4x_clk              (sys4x_clk),
    	.sys4x_rst              (sys4x_rst),
    
            // DRAM pins
        .ddram_a                (ddram_a      ),               
        .ddram_ba               (ddram_ba     ),              
        .ddram_ras_n            (ddram_ras_n  ),           
        .ddram_cas_n            (ddram_cas_n  ),           
        .ddram_we_n             (ddram_we_n   ),           
        .ddram_cs_n             (ddram_cs_n   ),            
        .ddram_dm               (ddram_dm     ),              
        .ddram_dq               (ddram_dq     ),              
        .ddram_dqs_p            (ddram_dqs_p  ),           
        .ddram_dqs_n            (ddram_dqs_n  ),           
        .ddram_clk_p            (ddram_clk_p  ),           
        .ddram_clk_n            (ddram_clk_n  ),           
        .ddram_cke              (ddram_cke    ),             
        .ddram_odt              (ddram_odt    ),             
        .ddram_reset_n          (ddram_reset_n),
    
        // DFI inputs
        .k7ddrphy_dfi_p0_address           (k7ddrphy_dfi_p0_address     ),
        .k7ddrphy_dfi_p0_bank              (k7ddrphy_dfi_p0_bank        ),
        .k7ddrphy_dfi_p0_cas_n             (k7ddrphy_dfi_p0_cas_n       ),
        .k7ddrphy_dfi_p0_cs_n              (k7ddrphy_dfi_p0_cs_n        ),
        .k7ddrphy_dfi_p0_ras_n             (k7ddrphy_dfi_p0_ras_n       ),
        .k7ddrphy_dfi_p0_we_n              (k7ddrphy_dfi_p0_we_n        ),
        .k7ddrphy_dfi_p0_cke               (k7ddrphy_dfi_p0_cke         ),
        .k7ddrphy_dfi_p0_odt               (k7ddrphy_dfi_p0_odt         ),
        .k7ddrphy_dfi_p0_reset_n           (k7ddrphy_dfi_p0_reset_n     ),
        .k7ddrphy_dfi_p0_wrdata            (k7ddrphy_dfi_p0_wrdata      ),
        .k7ddrphy_dfi_p0_wrdata_mask       (k7ddrphy_dfi_p0_wrdata_mask ),
        .k7ddrphy_dfi_p0_rddata            (k7ddrphy_dfi_p0_rddata      ),
        .k7ddrphy_dfi_p0_rddata_valid      (k7ddrphy_dfi_p0_rddata_valid),
        .k7ddrphy_dfi_p1_address           (k7ddrphy_dfi_p1_address     ),
        .k7ddrphy_dfi_p1_bank              (k7ddrphy_dfi_p1_bank        ),
        .k7ddrphy_dfi_p1_cas_n             (k7ddrphy_dfi_p1_cas_n       ),
        .k7ddrphy_dfi_p1_cs_n              (k7ddrphy_dfi_p1_cs_n        ),
        .k7ddrphy_dfi_p1_ras_n             (k7ddrphy_dfi_p1_ras_n       ),
        .k7ddrphy_dfi_p1_we_n              (k7ddrphy_dfi_p1_we_n        ),
        .k7ddrphy_dfi_p1_cke               (k7ddrphy_dfi_p1_cke         ),
        .k7ddrphy_dfi_p1_odt               (k7ddrphy_dfi_p1_odt         ),
        .k7ddrphy_dfi_p1_reset_n           (k7ddrphy_dfi_p1_reset_n     ),
        .k7ddrphy_dfi_p1_wrdata            (k7ddrphy_dfi_p1_wrdata      ),
        .k7ddrphy_dfi_p1_wrdata_mask       (k7ddrphy_dfi_p1_wrdata_mask ),
        .k7ddrphy_dfi_p1_rddata            (k7ddrphy_dfi_p1_rddata      ),
        .k7ddrphy_dfi_p1_rddata_valid      (k7ddrphy_dfi_p1_rddata_valid),
        .k7ddrphy_dfi_p2_address           (k7ddrphy_dfi_p2_address     ),
        .k7ddrphy_dfi_p2_bank              (k7ddrphy_dfi_p2_bank        ),
        .k7ddrphy_dfi_p2_cas_n             (k7ddrphy_dfi_p2_cas_n       ),
        .k7ddrphy_dfi_p2_cs_n              (k7ddrphy_dfi_p2_cs_n        ),
        .k7ddrphy_dfi_p2_ras_n             (k7ddrphy_dfi_p2_ras_n       ),
        .k7ddrphy_dfi_p2_we_n              (k7ddrphy_dfi_p2_we_n        ),
        .k7ddrphy_dfi_p2_cke               (k7ddrphy_dfi_p2_cke         ),
        .k7ddrphy_dfi_p2_odt               (k7ddrphy_dfi_p2_odt         ),
        .k7ddrphy_dfi_p2_reset_n           (k7ddrphy_dfi_p2_reset_n     ),
        .k7ddrphy_dfi_p2_wrdata            (k7ddrphy_dfi_p2_wrdata      ),
        .k7ddrphy_dfi_p2_wrdata_mask       (k7ddrphy_dfi_p2_wrdata_mask ),
        .k7ddrphy_dfi_p2_rddata_en         (k7ddrphy_dfi_p2_rddata_en   ),
        .k7ddrphy_dfi_p2_rddata            (k7ddrphy_dfi_p2_rddata      ),
        .k7ddrphy_dfi_p2_rddata_valid      (k7ddrphy_dfi_p2_rddata_valid),
        .k7ddrphy_dfi_p3_address           (k7ddrphy_dfi_p3_address     ),
        .k7ddrphy_dfi_p3_bank              (k7ddrphy_dfi_p3_bank        ),
        .k7ddrphy_dfi_p3_cas_n             (k7ddrphy_dfi_p3_cas_n       ),
        .k7ddrphy_dfi_p3_cs_n              (k7ddrphy_dfi_p3_cs_n        ),
        .k7ddrphy_dfi_p3_ras_n             (k7ddrphy_dfi_p3_ras_n       ),
        .k7ddrphy_dfi_p3_we_n              (k7ddrphy_dfi_p3_we_n        ),
        .k7ddrphy_dfi_p3_cke               (k7ddrphy_dfi_p3_cke         ),
        .k7ddrphy_dfi_p3_odt               (k7ddrphy_dfi_p3_odt         ),
        .k7ddrphy_dfi_p3_reset_n           (k7ddrphy_dfi_p3_reset_n     ),
        .k7ddrphy_dfi_p3_wrdata            (k7ddrphy_dfi_p3_wrdata      ),
        .k7ddrphy_dfi_p3_wrdata_en         (k7ddrphy_dfi_p3_wrdata_en   ),
        .k7ddrphy_dfi_p3_wrdata_mask       (k7ddrphy_dfi_p3_wrdata_mask ),
        .k7ddrphy_dfi_p3_rddata            (k7ddrphy_dfi_p3_rddata      ),
        .k7ddrphy_dfi_p3_rddata_valid      (k7ddrphy_dfi_p3_rddata_valid)
    
    );


endmodule

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
    
    
    output [14:0] k7ddrphy_dfi_p0_address    ,
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

    output [14:0] k7ddrphy_dfi_p1_address    ,
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

    output [14:0] k7ddrphy_dfi_p2_address    ,
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

    output [14:0] k7ddrphy_dfi_p3_address    ,
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

    reg [14:0] k7ddrphy_dfi_p0_address = 15'd0;
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

    reg [14:0] k7ddrphy_dfi_p1_address = 15'd0;
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
    
    reg [14:0] k7ddrphy_dfi_p2_address = 15'd0;
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
    
    reg [14:0] k7ddrphy_dfi_p3_address = 15'd0;
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

    reg [2:0] state;
    reg [5:0] index;
    reg [3:0] addr_index; // Accept at most 16 ACT commands

    wire [3:0] debug_probe = instr[(index+3)*4+:4];
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
