`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 03:21:52 PM
// Design Name: 
// Module Name: Immediate_Picker
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


module Immediate_Picker(imm_o, instruction, imm_select);

input [24:0] instruction;
input imm_select;

output reg [31:0] imm_o;

reg [31:0] i_imm, s_imm, b_imm, u_imm, j_imm;

always@ (instruction, imm_select) begin
    if (instruction[24] == 1) begin
        i_imm = {21'h1fffff, instruction[23:13]};
        s_imm = {21'h1fffff, instruction[23:18], instruction[4:0]};
        b_imm = {20'hfffff, instruction[0], instruction[23:18], instruction[4:1], 1'b0};
        u_imm = {instruction[24:5], 12'd0};
        j_imm = {12'hfff, instruction[12:5], instruction[13], instruction[23:14], 1'b0};
    end
    else begin
        i_imm = {21'd0, instruction[23:13]};
        s_imm = {21'd0, instruction[23:18], instruction[4:0]};
        b_imm = {20'd0, instruction[0], instruction[23:18], instruction[4:1], 1'b0};
        u_imm = {instruction[24:5], 12'd0};
        j_imm = {12'd0, instruction[12:5], instruction[13], instruction[23:14], 1'b0};
    end
 end 
 
 always@ (instruction[24]) begin
    case (imm_select)
        1:  imm_o = i_imm;
        2:  imm_o = s_imm;
        3:  imm_o = b_imm;
        4:  imm_o = u_imm;
        5:  imm_o = j_imm;
        default: imm_o = 32'd0;
    endcase 
 end

endmodule
