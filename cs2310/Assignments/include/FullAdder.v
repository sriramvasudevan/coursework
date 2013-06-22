`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:30:03 10/07/2012 
// Design Name: 
// Module Name:    FullAdder 
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

module FullAdder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );

assign sum = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (cin & a);

endmodule
