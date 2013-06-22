`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:45:45 10/07/2012 
// Design Name: 
// Module Name:    Mux2to1 
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

module Mux2to1(
    input a,
    input b,
    input select,
    output c
    );

reg c;

always@(a or b or select)
begin
	if(select == 1'b0)
		c = a;
	else
		c = b;
end

endmodule
