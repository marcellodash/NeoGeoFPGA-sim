`timescale 1ns/1ns

module FD4(
	input CK,
	input D,
	input PR, CL,
	output reg Q,
	output nQ
);

	//always @(posedge ~CK)	// negedge CK
	always @(posedge ~CK or posedge ~PR or posedge ~CL)	// negedge CK
	begin
		if (~PR)
			Q <= 1'b1;
		else if (~CL)
			Q <= 1'b0;
		else
			Q <= D;
	end
	
	assign nQ = ~Q;

endmodule
