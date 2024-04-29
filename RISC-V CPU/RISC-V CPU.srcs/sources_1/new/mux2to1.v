`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 05:29:20 PM
// Design Name: 
// Module Name: mux2to1
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


module mux2to1(out, select_0, select_1, select);

output reg  [31:0]  out;

input   [31:0]  select_0;
input   [31:0]  select_1;
input           select;

always @(*)
    assign out = select? select_1:select_0;

endmodule
