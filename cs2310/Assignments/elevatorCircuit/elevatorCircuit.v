`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:32 10/09/2012 
// Design Name: 
// Module Name:    elevator 
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
`include "../include/Mux2to1.v"
`include "../include/And.v"

module elevator(
    clk,
    start_stop,
    up_down,
    floor_no,
	 clk_out
    );

input clk, start_stop, up_down;
output [3:0] floor_no;
output clk_out;

wire[3:0] D, Q, Q_bar;
wire[9:0] w;

reg clear, flag;
reg[25:0] count;

D_FlipFlop Dff0(D[0], clk_out, 1'b0, clear, Q[0], Q_bar[0]);
Mux2to1 M00(~(start_stop ^ Q_bar[0]), start_stop ^ Q[0], up_down, w[0]);
Mux2to1 M01(w[0], Q[0], ((~up_down) & Q_bar[0] & Q_bar[1] & Q_bar[2] & Q_bar[3]) | (up_down & Q[3] & Q[1]), D[0]);
Mux2to1 M02(Q_bar[0], Q[0], up_down, w[1]);
And A0(start_stop, w[1], w[2]);

D_FlipFlop Dff1(D[1], clk_out, 1'b0, clear, Q[1], Q_bar[1]);
Mux2to1 M10(~(w[2] ^ Q_bar[1]), w[2] ^ Q[1], up_down, w[3]);
Mux2to1 M11(w[3], Q[1], ((~up_down) & Q_bar[0] & Q_bar[1] & Q_bar[2] & Q_bar[3]) | (up_down & Q[3] & Q[1]), D[1]);
Mux2to1 M12(Q_bar[1], Q[1], up_down, w[4]);
And A1(w[2], w[4], w[5]);

D_FlipFlop Dff2(D[2], clk_out, 1'b0, clear, Q[2], Q_bar[2]);
Mux2to1 M20(~(w[5] ^ Q_bar[2]), w[5] ^ Q[2], up_down, w[6]);
Mux2to1 M21(w[6], Q[2], ((~up_down) & Q_bar[0] & Q_bar[1] & Q_bar[2] & Q_bar[3]) | (up_down & Q[3] & Q[1]), D[2]);
Mux2to1 M22(Q_bar[2], Q[2], up_down, w[7]);
And A2(w[5], w[7], w[8]);

D_FlipFlop Dff3(D[3], clk_out, 1'b0, clear, Q[3], Q_bar[3]);
Mux2to1 M30(~(w[8] ^ Q_bar[3]), w[8] ^ Q[3], up_down, w[9]);
Mux2to1 M31(w[9], Q[3], ((~up_down) & Q_bar[0] & Q_bar[1] & Q_bar[2] & Q_bar[3]) | (up_down & Q[3] & Q[1]), D[3]);

assign floor_no = Q;

initial
begin
	flag = 1'b0;
	clear = 1'b1;
	count = 0;
end

always@(posedge clk)
begin
	count <= count + 1;
end

always@(posedge clk_out)
begin
	if(flag == 1'b1)
		clear <= 1'b0;
	else
		flag <= 1'b1;
end

assign clk_out = count[25];

endmodule
