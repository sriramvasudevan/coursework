`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:11 10/07/2012 
// Design Name: 
// Module Name:    Mux4to1 
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

module Mux4to1(
    input a,
    input b,
    input c,
    input d,
    input [1:0]select,
    output e
    );

reg e;

always@*
begin
	case(select)
		0 : e = a;
		1 : e = b;
		2 : e = c;
		3 : e = d;
	endcase
end

endmodule
