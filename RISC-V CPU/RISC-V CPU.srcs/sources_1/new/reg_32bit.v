`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 07:27:44 AM
// Design Name: 
// Module Name: reg_32bit
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


module reg_32bit(out, in, enable, reset, clk);

output [31:0] out;
reg [31:0] out;
input  [31:0] in;
input enable, clk, reset;

always @(posedge clk)
begin
	if(reset)
		out <= 0;
	else
	if(enable)
		out <= in;
end


endmodule
