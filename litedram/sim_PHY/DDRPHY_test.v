`timescale 1ns/1ps
module test();

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
    end

    always begin
        #2 sys4x_clk = ~sys4x_clk;
    end
    always begin
        #8 sys_clk = ~sys_clk;
    end
    
    reg [14:0] k7ddrphy_dfi_p0_address = 15'd0;
    reg [2:0] k7ddrphy_dfi_p0_bank = 3'd0;
    reg k7ddrphy_dfi_p0_cas_n = 1'd1;
    reg k7ddrphy_dfi_p0_cs_n = 1'd1;
    reg k7ddrphy_dfi_p0_ras_n = 1'd1;
    reg k7ddrphy_dfi_p0_we_n = 1'd1;
    reg k7ddrphy_dfi_p0_cke = 1'd0;
    reg k7ddrphy_dfi_p0_odt = 1'd0;
    reg k7ddrphy_dfi_p0_reset_n = 1'd0;
    reg [63:0] k7ddrphy_dfi_p0_wrdata = 64'd0;
    reg [7:0] k7ddrphy_dfi_p0_wrdata_mask = 8'd0;
    wire [63:0] k7ddrphy_dfi_p0_rddata;
    wire k7ddrphy_dfi_p0_rddata_valid;
    reg [14:0] k7ddrphy_dfi_p1_address = 15'd0;
    reg [2:0] k7ddrphy_dfi_p1_bank = 3'd0;
    reg k7ddrphy_dfi_p1_cas_n = 1'd1;
    reg k7ddrphy_dfi_p1_cs_n = 1'd1;
    reg k7ddrphy_dfi_p1_ras_n = 1'd1;
    reg k7ddrphy_dfi_p1_we_n = 1'd1;
    reg k7ddrphy_dfi_p1_cke = 1'd0;
    reg k7ddrphy_dfi_p1_odt = 1'd0;
    reg k7ddrphy_dfi_p1_reset_n = 1'd0;
    reg [63:0] k7ddrphy_dfi_p1_wrdata = 64'd0;
    reg [7:0] k7ddrphy_dfi_p1_wrdata_mask = 8'd0;
    wire [63:0] k7ddrphy_dfi_p1_rddata;
    wire k7ddrphy_dfi_p1_rddata_valid;
    reg [14:0] k7ddrphy_dfi_p2_address = 15'd0;
    reg [2:0] k7ddrphy_dfi_p2_bank = 3'd0;
    reg k7ddrphy_dfi_p2_cas_n = 1'd1;
    reg k7ddrphy_dfi_p2_cs_n = 1'd1;
    reg k7ddrphy_dfi_p2_ras_n = 1'd1;
    reg k7ddrphy_dfi_p2_we_n = 1'd1;
    reg k7ddrphy_dfi_p2_cke = 1'd0;
    reg k7ddrphy_dfi_p2_odt = 1'd0;
    reg k7ddrphy_dfi_p2_reset_n = 1'd0;
    reg [63:0] k7ddrphy_dfi_p2_wrdata = 64'd0;
    reg [7:0] k7ddrphy_dfi_p2_wrdata_mask = 8'd0;
    reg k7ddrphy_dfi_p2_rddata_en = 1'd0;
    wire [63:0] k7ddrphy_dfi_p2_rddata;
    wire k7ddrphy_dfi_p2_rddata_valid;
    reg [14:0] k7ddrphy_dfi_p3_address = 15'd0;
    reg [2:0] k7ddrphy_dfi_p3_bank = 3'd0;
    reg k7ddrphy_dfi_p3_cas_n = 1'd1;
    reg k7ddrphy_dfi_p3_cs_n = 1'd1;
    reg k7ddrphy_dfi_p3_ras_n = 1'd1;
    reg k7ddrphy_dfi_p3_we_n = 1'd1;
    reg k7ddrphy_dfi_p3_cke = 1'd0;
    reg k7ddrphy_dfi_p3_odt = 1'd0;
    reg k7ddrphy_dfi_p3_reset_n = 1'd0;
    reg [63:0] k7ddrphy_dfi_p3_wrdata = 64'd0;
    reg k7ddrphy_dfi_p3_wrdata_en = 1'd0;
    reg [7:0] k7ddrphy_dfi_p3_wrdata_mask = 8'd0;
    wire [63:0] k7ddrphy_dfi_p3_rddata;
    wire k7ddrphy_dfi_p3_rddata_valid;

    initial begin
        #169
        k7ddrphy_dfi_p0_we_n = 0;
        k7ddrphy_dfi_p1_cas_n = 0;
        k7ddrphy_dfi_p2_ras_n = 0;
        k7ddrphy_dfi_p3_cke = 1;
        k7ddrphy_dfi_p0_address = 15'h1111; 
        k7ddrphy_dfi_p1_address = 15'h2222; 
        k7ddrphy_dfi_p2_address = 15'h3333; 
        k7ddrphy_dfi_p3_address = 15'h4444; 

        #16
        k7ddrphy_dfi_p0_we_n = 1;
        k7ddrphy_dfi_p1_cas_n = 1;
        k7ddrphy_dfi_p2_ras_n = 1;
        k7ddrphy_dfi_p2_cas_n = 0;
        k7ddrphy_dfi_p3_cke = 0;
        k7ddrphy_dfi_p0_address = 15'h5555; 
        k7ddrphy_dfi_p1_address = 15'h6666; 
        k7ddrphy_dfi_p2_address = 15'h7777; 
        k7ddrphy_dfi_p3_address = 15'h8888; 
        k7ddrphy_dfi_p3_wrdata_en = 1'd1;
        k7ddrphy_dfi_p3_wrdata_mask = 8'hff;

        #16
        k7ddrphy_dfi_p2_cas_n = 1;
        k7ddrphy_dfi_p3_wrdata_en = 1'd0;
        k7ddrphy_dfi_p0_wrdata = 64'hb0b0_b1b1_b2b2_b3b3;
        k7ddrphy_dfi_p1_wrdata = 64'ha0a0_a1a1_a2a2_a3a3;
        k7ddrphy_dfi_p2_wrdata = 64'h9090_9191_9292_9393;
        k7ddrphy_dfi_p3_wrdata = 64'h8080_8181_8282_8383;

        #16
        k7ddrphy_dfi_p0_wrdata = 64'hf0f0_f1f1_f2f2_f3f3;
        k7ddrphy_dfi_p1_wrdata = 64'he0e0_e1e1_e2e2_e3e3;
        k7ddrphy_dfi_p2_wrdata = 64'hd0d0_d1d1_d2d2_d3d3;
        k7ddrphy_dfi_p3_wrdata = 64'hc0c0_c1c1_c2c2_c3c3;
        
        #16
        k7ddrphy_dfi_p0_wrdata = 64'h7070_7171_7272_7373;
        k7ddrphy_dfi_p1_wrdata = 64'h6060_6161_6262_6363;
        k7ddrphy_dfi_p2_wrdata = 64'h5050_5151_5252_5353;
        k7ddrphy_dfi_p3_wrdata = 64'h4040_4141_4242_4343;
        
        #16
        k7ddrphy_dfi_p0_wrdata = 64'h0;
        k7ddrphy_dfi_p1_wrdata = 64'h0;
        k7ddrphy_dfi_p2_wrdata = 64'h0;
        k7ddrphy_dfi_p3_wrdata = 64'h0;
    end

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
