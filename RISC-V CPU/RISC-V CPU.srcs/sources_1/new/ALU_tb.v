`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 06:07:03 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();

reg   [3:0]   op; 
reg   [31:0]  a;
reg   [31:0]  b;

wire [31:0]  out;

ALU uut(op, a, b, out);

initial begin
    op = 0;
    a  = 32'd6;
    b  = 32'd9;
      
    #10 
    op = 4'b0000;
    
    #10
    op = 4'b1000;
    
    #10
    op = 4'b0111;
    
    #10
    op = 4'b0110;
    
    #10
    op = 4'b0100;
    
    #10
    op = 4'b0001;
    
    #10
    op = 4'b0101;
    
    #10
    op = 4'b1101;
    a = 32'hfffffff6;
    #10
    op = 4'b0011;
    a = 6;
    #10
    op = 4'b0010;
    
    #10
    a = -6;
    
    #10
    b = -9;
    
    #10
    a = 6;
    
    #10
    op = 4'b1111;
    end
endmodule
