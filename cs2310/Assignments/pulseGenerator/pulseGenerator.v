`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:41:27 10/09/2012 
// Design Name: 
// Module Name:    pulseGenerator
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

`include "../include/D_FlipFlop.v"

module pulseGenerator(
    clk,
    initial_state,
    pulse,
	 clk_out
    );

input clk;
input [2:0] initial_state;
output pulse, clk_out;

wire[2:0] Q;
reg[2:0] p, c;

reg[25:0] count;

reg flag;

D_FlipFlop Dff2(Q[2] ^ Q[0], clk_out, p[2], c[2], Q[2], );
D_FlipFlop Dff1(Q[2], clk_out, p[1], c[1], Q[1], );
D_FlipFlop Dff0(Q[1], clk_out, p[0], c[0], Q[0], );

assign pulse = (~Q[2]) & Q[0];

initial
begin
	count = 0;
	flag = 1'b0;
end

always@(posedge clk)
begin
	count <= count + 1;	
end

always@(posedge clk_out)
begin
	if(flag == 1'b1)
	begin
		p <= 3'b000;
		c <= 3'b000;
	end
	else
	begin
		p <= initial_state;
		c <= ~initial_state;
		flag <= 1'b1;
	end
end

assign clk_out = count[25];

// Initial state for 1000100 is 001

endmodule
