`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:46 10/09/2012 
// Design Name: 
// Module Name:    airportHangar 
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

`include "../include/Xor.v"
`include "../inclue/Mux2to1.v"

module airportHangar(
    input [3:0] PlaneNo,
    input Airport,
    output Hanger
    );

wire w;

Mux2to1 Mux(PlaneNo[1], 0, Airport, w);
Xor Gate(PlaneNo[2], w, Hanger);

// Airport = 0 is Kolkata and Airport = 1 is Chennai
// Output = 0 for Hanger A and Output = 1 for Hanger B

endmodule
