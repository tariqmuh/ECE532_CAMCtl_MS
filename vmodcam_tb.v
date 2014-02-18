`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:28:27 02/17/2014
// Design Name:   vmodcam
// Module Name:   C:/Users/tariqmuh/Documents/GitHub/ECE552_CamCtl/vmodcam_tb.v
// Project Name:  UserLogicWithCamCtlOnly
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vmodcam
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vmodcam_tb;

	// Inputs
	reg [7:0] SW_I;
	reg RESET_I;
	reg CamClk;
	reg CamClk_180;
	reg S_AXI_ACLK;
	reg S_AXI_ARESETN;
	reg [31:0] S_AXI_AWADDR;
	reg S_AXI_AWVALID;
	reg [31:0] S_AXI_WDATA;
	reg [3:0] S_AXI_WSTRB;
	reg S_AXI_WVALID;
	reg S_AXI_BREADY;
	reg [31:0] S_AXI_ARADDR;
	reg S_AXI_ARVALID;
	reg S_AXI_RREADY;
	reg m_axi_aclk;
	reg m_axi_aresetn;
	reg m_axi_arready;
	reg m_axi_rvalid;
	reg [31:0] m_axi_rdata;
	reg [1:0] m_axi_rresp;
	reg m_axi_rlast;
	reg m_axi_awready;
	reg m_axi_wready;
	reg m_axi_bvalid;
	reg [1:0] m_axi_bresp;

	// Outputs
	wire [7:0] LED_O;
	wire CAMA_MCLK_O;
	wire CAMA_RST_O;
	wire CAMA_PWDN_O;
	wire CAMX_VDDEN_O;
	wire CAMB_MCLK_O;
	wire CAMB_RST_O;
	wire CAMB_PWDN_O;
	wire CAMA_CLK;
	wire S_AXI_ARREADY;
	wire [31:0] S_AXI_RDATA;
	wire [1:0] S_AXI_RRESP;
	wire S_AXI_RVALID;
	wire S_AXI_WREADY;
	wire [1:0] S_AXI_BRESP;
	wire S_AXI_BVALID;
	wire S_AXI_AWREADY;
	wire md_error;
	wire m_axi_arvalid;
	wire [31:0] m_axi_araddr;
	wire [7:0] m_axi_arlen;
	wire [2:0] m_axi_arsize;
	wire [1:0] m_axi_arburst;
	wire [2:0] m_axi_arprot;
	wire [3:0] m_axi_arcache;
	wire m_axi_rready;
	wire m_axi_awvalid;
	wire [31:0] m_axi_awaddr;
	wire [7:0] m_axi_awlen;
	wire [2:0] m_axi_awsize;
	wire [1:0] m_axi_awburst;
	wire [2:0] m_axi_awprot;
	wire [3:0] m_axi_awcache;
	wire m_axi_wvalid;
	wire [31:0] m_axi_wdata;
	wire [3:0] m_axi_wstrb;
	wire m_axi_wlast;
	wire m_axi_bready;

	// Bidirs
	wire CAMA_SDA;
	wire CAMA_SCL;
	wire [7:0] CAMA_D_I;
	wire CAMA_PCLK_I;
	wire CAMA_LV_I;
	wire CAMA_FV_I;
	wire CAMB_SDA;
	wire CAMB_SCL;
	wire [7:0] CAMB_D_I;
	wire CAMB_PCLK_I;
	wire CAMB_LV_I;
	wire CAMB_FV_I;
	parameter state1 = 2'b00, state2 = 2'b01, state3 = 2'b10, state4 = 2'b11;
	reg [1:0] curr_state;	
	always
		#5 m_axi_aclk = ~m_axi_aclk;
	
	always
	 #5 S_AXI_ACLK = ~S_AXI_ACLK;

	// Instantiate the Unit Under Test (UUT)
	vmodcam uut (
		.SW_I(SW_I), 
		.LED_O(LED_O), 
		.RESET_I(RESET_I), 
		.CamClk(CamClk), 
		.CamClk_180(CamClk_180), 
		.CAMA_SDA(CAMA_SDA), 
		.CAMA_SCL(CAMA_SCL), 
		.CAMA_D_I(CAMA_D_I), 
		.CAMA_PCLK_I(CAMA_PCLK_I), 
		.CAMA_MCLK_O(CAMA_MCLK_O), 
		.CAMA_LV_I(CAMA_LV_I), 
		.CAMA_FV_I(CAMA_FV_I), 
		.CAMA_RST_O(CAMA_RST_O), 
		.CAMA_PWDN_O(CAMA_PWDN_O), 
		.CAMX_VDDEN_O(CAMX_VDDEN_O), 
		.CAMB_SDA(CAMB_SDA), 
		.CAMB_SCL(CAMB_SCL), 
		.CAMB_D_I(CAMB_D_I), 
		.CAMB_PCLK_I(CAMB_PCLK_I), 
		.CAMB_MCLK_O(CAMB_MCLK_O), 
		.CAMB_LV_I(CAMB_LV_I), 
		.CAMB_FV_I(CAMB_FV_I), 
		.CAMB_RST_O(CAMB_RST_O), 
		.CAMB_PWDN_O(CAMB_PWDN_O), 
		.CAMA_CLK(CAMA_CLK), 
		.S_AXI_ACLK(S_AXI_ACLK), 
		.S_AXI_ARESETN(S_AXI_ARESETN), 
		.S_AXI_AWADDR(S_AXI_AWADDR), 
		.S_AXI_AWVALID(S_AXI_AWVALID), 
		.S_AXI_WDATA(S_AXI_WDATA), 
		.S_AXI_WSTRB(S_AXI_WSTRB), 
		.S_AXI_WVALID(S_AXI_WVALID), 
		.S_AXI_BREADY(S_AXI_BREADY), 
		.S_AXI_ARADDR(S_AXI_ARADDR), 
		.S_AXI_ARVALID(S_AXI_ARVALID), 
		.S_AXI_RREADY(S_AXI_RREADY), 
		.S_AXI_ARREADY(S_AXI_ARREADY), 
		.S_AXI_RDATA(S_AXI_RDATA), 
		.S_AXI_RRESP(S_AXI_RRESP), 
		.S_AXI_RVALID(S_AXI_RVALID), 
		.S_AXI_WREADY(S_AXI_WREADY), 
		.S_AXI_BRESP(S_AXI_BRESP), 
		.S_AXI_BVALID(S_AXI_BVALID), 
		.S_AXI_AWREADY(S_AXI_AWREADY), 
		.m_axi_aclk(m_axi_aclk), 
		.m_axi_aresetn(m_axi_aresetn), 
		.md_error(md_error), 
		.m_axi_arready(m_axi_arready), 
		.m_axi_arvalid(m_axi_arvalid), 
		.m_axi_araddr(m_axi_araddr), 
		.m_axi_arlen(m_axi_arlen), 
		.m_axi_arsize(m_axi_arsize), 
		.m_axi_arburst(m_axi_arburst), 
		.m_axi_arprot(m_axi_arprot), 
		.m_axi_arcache(m_axi_arcache), 
		.m_axi_rready(m_axi_rready), 
		.m_axi_rvalid(m_axi_rvalid), 
		.m_axi_rdata(m_axi_rdata), 
		.m_axi_rresp(m_axi_rresp), 
		.m_axi_rlast(m_axi_rlast), 
		.m_axi_awready(m_axi_awready), 
		.m_axi_awvalid(m_axi_awvalid), 
		.m_axi_awaddr(m_axi_awaddr), 
		.m_axi_awlen(m_axi_awlen), 
		.m_axi_awsize(m_axi_awsize), 
		.m_axi_awburst(m_axi_awburst), 
		.m_axi_awprot(m_axi_awprot), 
		.m_axi_awcache(m_axi_awcache), 
		.m_axi_wready(m_axi_wready), 
		.m_axi_wvalid(m_axi_wvalid), 
		.m_axi_wdata(m_axi_wdata), 
		.m_axi_wstrb(m_axi_wstrb), 
		.m_axi_wlast(m_axi_wlast), 
		.m_axi_bready(m_axi_bready), 
		.m_axi_bvalid(m_axi_bvalid), 
		.m_axi_bresp(m_axi_bresp)
	);

	initial begin
		// Initialize Inputs
		SW_I = 0;
		RESET_I = 0;
		CamClk = 0;
		CamClk_180 = 0;
		S_AXI_ACLK = 0;
		S_AXI_ARESETN = 0;
		S_AXI_AWADDR = 0;
		S_AXI_AWVALID = 0;
		S_AXI_WDATA = 0;
		S_AXI_WSTRB = 0;
		S_AXI_WVALID = 0;
		S_AXI_BREADY = 0;
		S_AXI_ARADDR = 0;
		S_AXI_ARVALID = 0;
		S_AXI_RREADY = 0;
		m_axi_aclk = 0;
		m_axi_aresetn = 0;
		m_axi_arready = 0;
		m_axi_rvalid = 0;
		m_axi_rdata = 0;
		m_axi_rresp = 0;
		m_axi_rlast = 0;
		m_axi_awready = 0;
		m_axi_wready = 0;
		m_axi_bvalid = 0;
		m_axi_bresp = 0;

		// Wait 100 ns for global reset to finish
		#100;
      m_axi_aresetn  = 1;
		m_axi_awready = 1;
		S_AXI_ARESETN = 1;
		#50
		m_axi_aresetn  = 0;
		S_AXI_ARESETN = 0;
		#50
		m_axi_aresetn  = 1;
		S_AXI_ARESETN = 1;
		// Add stimulus here
    #100000;
	
	 $finish;
	
		

	end
	

	always @(posedge m_axi_aclk)
	begin
		case (curr_state)
			state1:
			begin
				m_axi_awready <= 1;
				m_axi_wready <= 0;
				m_axi_bvalid <= 0;
				if (m_axi_awvalid == 1) begin
					curr_state <= state2;
				end
			end
			state2:
			begin
				m_axi_awready <= 0;
				m_axi_wready <= 1;
				curr_state = state3;
			end
			state3:
			begin
				m_axi_awready <= 1;
				//m_axi_wready <= 1;
				if (m_axi_wlast == 1) begin
					curr_state = state4;
				end
//				if (m_axi_wvalid == 1) begin
//					curr_state = state4;
//				end
			end
			state4:
			begin
				m_axi_bvalid <= 1;
				//m_axi_wready <= 0;
				m_axi_bresp[1:0] <= 2'b00;
				if (m_axi_wvalid == 0) begin 
					curr_state = state1;
				end
			end
			default: 
			begin
			  curr_state = state1;
		  end
		endcase
	end
	
endmodule

