`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:25 10/09/2012 
// Design Name: 
// Module Name:    acceptsCash 
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

`include "../include/Mux4to1.v"

module acceptsCash(
    input [4:0] number,
    output type
    );

Mux4to1 Mux(~number[3], ~number[2], number[4] | ((~number[3]) & (~number[2])), (~number[4]) & (~number[3]), number[1:0], type);

endmodule
