`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:49:13 10/07/2012 
// Design Name: 
// Module Name:    D_FlipFlop 
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

module D_FlipFlop(
    input D,
    input Clock,
    input Preset,
    input Clear,
    output Q,
    output Q_bar
    );

reg Q;
reg Q_bar;

always@(posedge Clock or Preset or Clear)
begin
	if(Preset == 1'b1)
	begin
		Q <= 1;
		Q_bar <= 0;
	end
	else if(Clear == 1'b1)
	begin
		Q <= 0;
		Q_bar <= 1;
	end
	else
	begin
		Q <= D;
		Q_bar <= ~D;
	end
end

endmodule
