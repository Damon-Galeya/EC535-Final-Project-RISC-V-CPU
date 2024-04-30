`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 07:16:33 PM
// Design Name: 
// Module Name: Control_tb
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


module Control_tb();

reg   [31:0]  Instruction, a, b;
wire   BrEq, BrLT;

wire [3:0]ALU_Op;
wire  [2:0]Imm_Sel;
wire  [1:0]WB_Sel;
wire  PC_Sel, Br_Un;
wire  A_Sel, B_Sel;
wire  Reg_WEn, Mem_RW;
wire  IF_flush, ID_flush, EX_flush;



compare_32bit branch(BrLT, BrEq, a, b, Br_Un);
Control uut(PC_Sel, Imm_Sel, Reg_WEn, Br_Un, A_Sel, B_Sel, ALU_Op, Mem_RW, WB_Sel, IF_flush, ID_flush, EX_flush, Instruction, BrEq, BrLT);

initial begin

    Instruction = 0;
    a = 32'd69;
    b = 32'd420;
   // BrEq = 0;
    //BrLT = 0;
    
    //beq
    #10
    Instruction = 32'b0_101010_00000_00000_000_00100_1100011;
//    BrEq = 0;
//    BrLT = 0;
    
    #10
    Instruction = 32'b0_101010_00000_00000_000_00100_1100011;
//    BrEq = 0;
//    BrLT = 1;
    
    #10
    Instruction = 32'b0_101010_00000_00000_000_00100_1100011;
//    BrEq = 1;
//    BrLT = 0;
    
    #10
    Instruction = 32'b0_101010_00000_00000_000_00100_1100011;
//    BrEq = 1;
//    BrLT = 1;
    
    //bne
    #10
    Instruction = 32'b0_101010_00000_00000_001_00100_1100011;
//    BrEq = 0;
//    BrLT = 0;
    
    #10
    Instruction = 32'b0_101010_00000_00000_001_00100_1100011;
//    BrEq = 0;
//    BrLT = 1;
    
    #10
    Instruction = 32'b0_101010_00000_00000_001_00100_1100011;
//    BrEq = 1;
//    BrLT = 0;
    a = 32'hf0000001;
    b = 32'd69;
    #10
    Instruction = 32'b0_101010_00000_00000_001_00100_1100011;
//    BrEq = 1;
//    BrLT = 1;
    
    //bltu
    #10
    Instruction = 32'b0_101010_00000_00000_110_00100_1100011;
//    BrEq = 0;
//    BrLT = 0;
    
    #10
    Instruction = 32'b0_101010_00000_00000_110_00100_1100011;
//    BrEq = 0;
//    BrLT = 1;
    
    #10
    Instruction = 32'b0_101010_00000_00000_110_00100_1100011;
//    BrEq = 1;
//    BrLT = 0;
    
    #10
    Instruction = 32'b0_101010_00000_00000_110_00100_1100011;
//    BrEq = 1;
//    BrLT = 1;
    
    //bgeu
    #10
    Instruction = 32'b0_101010_00000_00000_111_00100_1100011;
//    BrEq = 0;
//    BrLT = 0;
    
    #10
    Instruction = 32'b0_101010_00000_00000_111_00100_1100011;
//    BrEq = 0;
//    BrLT = 1;
    
    #10
    Instruction = 32'b0_101010_00000_00000_111_00100_1100011;
//    BrEq = 1;
//    BrLT = 0;
    
    #10
    Instruction = 32'b0_101010_00000_00000_111_00100_1100011;
//    BrEq = 1;
//    BrLT = 1;
 
 end

endmodule
