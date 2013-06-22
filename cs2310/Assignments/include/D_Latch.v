`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:43:09 10/07/2012 
// Design Name: 
// Module Name:    D_Latch 
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

module D_Latch(
    input D,
    input Clock,
    input Preset,
    input Clear,
    output Q,
    output Q_bar
    );

reg Q;
reg Q_bar;

always@(D or Clock or Preset or Clear)
begin
	if(Preset == 1'b1)
	begin
		Q = 1;
		Q_bar = 0;
	end
	else if(Clear == 1'b1)
	begin
		Q = 0;
		Q_bar = 1;
	end
	else if(Clock == 1'b1)
	begin
		Q = D;
		Q_bar = ~D;
	end
end

endmodule
