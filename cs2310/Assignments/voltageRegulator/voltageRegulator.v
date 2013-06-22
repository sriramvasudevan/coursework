`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:42 10/09/2012 
// Design Name: 
// Module Name:    voltage_regulator 
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
`include "../include/RippleAdder.v"

module voltage_regulator(
    input [3:0] ip_volt,
    output [3:0] op_volt
    );

wire[1:0] check;
wire[3:0] sum;

RippleAdder RCA(ip_volt, 4'b1010, 0, sum, check[1]);

assign check[0] = sum[3] | sum[2];

Mux4to1 M3(0, 0, ip_volt[3], 1, check, op_volt[3]);
Mux4to1 M2(1, 1, ip_volt[2], 0, check, op_volt[2]);
Mux4to1 M1(0, 0, ip_volt[1], 1, check, op_volt[1]);
Mux4to1 M0(1, 1, ip_volt[0], 0, check, op_volt[0]);

endmodule
