`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 05:21:34 PM
// Design Name: 
// Module Name: add_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module add_4(out, in);

input   [31:0]  in;
output  reg [31:0]  out;

always @(*)
    assign out  = in + 4;

endmodule
