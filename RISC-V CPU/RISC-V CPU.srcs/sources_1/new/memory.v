`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 07:47:12 PM
// Design Name: 
// Module Name: memory
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


module memory(data_o, data_i, address, mem_write, mem_read, clk);

input clk, mem_read, mem_write;
input [31:0] address, data_i;

output [31:0] data_o;

integer       i;
   
   reg [31:0]    mem_array [0:127];
   
   initial begin
      // Fill the first 128 memory cells, each with its own address
      for (i=0; i<128; i=i+1)
        mem_array[i] <= i;
      
   end
   
   always @(posedge clk)
     begin
        if(mem_write)
          mem_array[address] <= data_i;
     end
   
   assign data_o = mem_array[address];
endmodule
