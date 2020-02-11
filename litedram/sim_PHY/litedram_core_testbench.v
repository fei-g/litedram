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

    reg user_port_native_0_cmd_valid            = 0;
    wire user_port_native_0_cmd_ready           ;
    reg user_port_native_0_cmd_we               = 0;
    reg [23:0] user_port_native_0_cmd_addr      = 0;
    reg user_port_native_0_wdata_valid          = 0;
    wire user_port_native_0_wdata_ready         ;
    reg [31:0] user_port_native_0_wdata_we      = 0;
    reg [255:0] user_port_native_0_wdata_data   = 0;
    wire user_port_native_0_rdata_valid         ;
    reg user_port_native_0_rdata_ready          = 0;
    wire [255:0] user_port_native_0_rdata_data  ;
    
    wire    pll_locked;
    wire    init_done;
    wire    init_error;

    reg [9:0] ComputeDRAM_R1;
    reg [9:0] ComputeDRAM_R2;
    reg [3:0] ComputeDRAM_T1;
    reg [3:0] ComputeDRAM_T2;
    reg ComputeDRAM_vld;
    wire ComputeDRAM_rdy;

    initial begin
        ComputeDRAM_R1  = 0;
        ComputeDRAM_R2  = 0;
        ComputeDRAM_T1  = 0;
        ComputeDRAM_T2  = 0;
        ComputeDRAM_vld = 0;

        #101
        ComputeDRAM_R1  = 4;
        ComputeDRAM_R2  = 5;
        ComputeDRAM_T1  = 2;
        ComputeDRAM_T2  = 2;
        ComputeDRAM_vld = 1;

        #10
        ComputeDRAM_R1  = 0;
        ComputeDRAM_R2  = 0;
        ComputeDRAM_T1  = 0;
        ComputeDRAM_T2  = 0;
        ComputeDRAM_vld = 0;
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

	input [9:0] ComputeDRAM_R1,
	input [9:0] ComputeDRAM_R2,
	input [3:0] ComputeDRAM_T1,
	input [3:0] ComputeDRAM_T2,
	input ComputeDRAM_vld,
	output ComputeDRAM_rdy
    );

endmodule
