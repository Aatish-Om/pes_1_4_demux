
`timescale 1ns / 1ps
module pes_1_4_demux_tb();
	// Inputs
	reg i;
	reg [1:0] sel;
	
	//TB Signals
	reg clk,reset;

	// Outputs
	wire o3,o2,o1,o0;

        // Instantiate the Unit Under Test (UUT)
	pes_1_4_demux uut (
		.sel(sel),
		.o0(o0),
		.o1(o1),
		.o2(o2),
		.o3(o3),
		.i(i)
	);

	initial begin
	$dumpfile("pes_1_4_demux_tb.vcd");
	$dumpvars(0,pes_1_4_demux_tb);
	// Initialize Inputs
	i = 1'b0;
	clk = 1'b0;
	reset = 1'b0 ;  #1;
	reset = 1'b1 ;  #10;
	reset = 1'b0;

	#3900 $finish;
	end

always #17 i = ~i;
always #300 clk = ~clk;

always @ (posedge clk , posedge reset)
begin
	if(reset)
		sel <= 3'b000;
	else
		sel <= sel + 1;
end



endmodule


