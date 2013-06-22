`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:21 11/06/2012 
// Design Name: 
// Module Name:    GrayCodeConverter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//The NAND Gate Module.
module NAND(
	input a,
	input b,
	output c
	);
	
	assign c = ~(a & b);
	
endmodule

//XOR Gate Module that makes use of 4 NAND Gates.
module XOR(
	input a,
	input b,
	output c
	);
	
	wire d[2:0];
	
	NAND N1(a, b, d[0]);
	NAND N2(a, d[0], d[1]);
	NAND N3(b, d[0], d[2]);
	NAND N4(d[1], d[2], c);

endmodule	

//The 4-bit Gray Code to equivalent 4-bit Binary Code Converter Module.
module GrayCodeConverter(
    input [3:0] a,
    output [3:0] b
    );
	 
	 assign b[3] = a[3]; //or use XOR X4(a[3], 1'b0, b[3]); if assign statements are to be avoided entirely. But this results in an unnecessary use of an extra XOR gate.
	 XOR X1(a[3], a[2], b[2]);
	 XOR X2(b[2], a[1], b[1]);
	 XOR X3(b[1], a[0], b[0]);

endmodule
