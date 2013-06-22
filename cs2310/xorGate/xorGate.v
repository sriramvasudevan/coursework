`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:41:46 10/07/2012 
// Design Name: 
// Module Name:    xorGate
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

`include "../include/Nand.v"

module xorGate(
    input a,
    input b,
    output o
    );

wire [2:0] w;

Nand N1(a, b, w[0]);
Nand N2(a, w[0], w[1]);
Nand N3(b, w[0], w[2]);
Nand N4(w[1], w[2], o);

endmodule
