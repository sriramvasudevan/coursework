`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:15 10/09/2012 
// Design Name: 
// Module Name:    currentSensor 
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

`include "../include/RippleAdder.v"
`include "../include/Mux2to1.v"

module currentSensor(
    current_I1,
    current_I2,
    current_I3_tens,
    current_I3_ones,
    warning_bit
    );

input [2:0] current_I1, current_I2;
output [2:0] current_I3_tens;
output [3:0] current_I3_ones;
output warning_bit;

wire[3:0] current_sum;

RippleAdder RA({1'b0, current_I1[2:0]}, {1'b0, current_I2[2:0]}, 1'b0, current_sum, );

assign current_I3_tens = current_sum[3] & (current_sum[2] | current_sum[1]);

assign warning_bit = current_sum[2] & current_sum[3] & (current_sum[1] | current_sum[0]);

assign current_I3_ones[0] = current_sum[0];

Mux2to1 Mux3(current_sum[3], 1'b0, current_I3_tens[0], current_I3_ones[3]);
Mux2to1 Mux2(current_sum[2], current_sum[2] & current_sum[1], current_I3_tens[0], current_I3_ones[2]);
Mux2to1 Mux1(current_sum[1], ~current_sum[1], current_I3_tens[0], current_I3_ones[1]);

endmodule
