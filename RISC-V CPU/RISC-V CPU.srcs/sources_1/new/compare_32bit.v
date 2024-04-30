`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 05:25:10 PM
// Design Name: 
// Module Name: compare_32bit
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


module compare_32bit(lt, eq, a, b, unsign);

input [31:0] a, b;
input unsign;

output lt, eq;

reg out;

always @(a, b, unsign) begin
    case ({unsign,a[31],b[31]})
        3'b001: out = 1'b0;
        3'b010: out = 1'b1;
        3'b011: out = a > b;
        default: out = a < b;
    endcase    
end
 
assign eq = a==b;
assign lt = out;

endmodule
