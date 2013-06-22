`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:46 10/07/2012 
// Design Name: 
// Module Name:    Nor 
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

`include "Or.v"
`include "Not.v"

module Nor(
    input a,
    input b,
    output c
    );

wire w;

Or O(a, b, w);
Not N(w, c);

endmodule
