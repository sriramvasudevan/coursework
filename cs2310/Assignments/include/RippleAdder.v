`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:34:15 10/07/2012 
// Design Name: 
// Module Name:    RippleAdder 
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

`include "FullAdder.v"

module RippleAdder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] c,
    output cout
    );

wire [3:1]carry;

FullAdder FA0(a[0], b[0], cin, c[0], carry[1]);
FullAdder FA1(a[1], b[1], carry[1], c[1], carry[2]);
FullAdder FA2(a[2], b[2], carry[2], c[2], carry[3]);
FullAdder FA3(a[3], b[3], carry[3], c[3], cout);

endmodule
