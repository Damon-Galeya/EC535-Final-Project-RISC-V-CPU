`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 10:29:05 PM
// Design Name: 
// Module Name: Control
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


module Control(PC_Sel, Imm_Sel, Reg_WEn, Br_Un, A_Sel, B_Sel, ALU_Op, Mem_RW, WB_Sel, Instruction, BrEq, BrLT, IF_flush, ID_flush, EX_flush);

input   [31:0]  Instruction;
input   BrEq, BrLT;

output reg PC_Sel, Br_Un;
output reg A_Sel, B_Sel, Imm_Sel;
output reg Reg_WEn, Mem_RW;
output reg IF_flush, ID_flush, EX_flush;

wire [4:0]  OpCode  = Instruction[6:2];
wire [2:0]  funct3  = Instruction[14:12];
wire        r_funct7  = Instruction[30]; //bit for sub and sra
wire        i_funct7 = Instruction[28]; // bit for sra

output reg [3:0]ALU_Op;
output reg [1:0]WB_Sel;

//OpCode Instructions
parameter r_type    = 5'b01100;
parameter i_type    = 5'b00100;
parameter load      = 5'b00000;
parameter store     = 5'b01000;
parameter b_type    = 5'b11000;
parameter jal       = 5'b11011;
parameter jalr      = 5'b11001;
parameter lui       = 5'b01101;
parameter auipc     = 5'b00101;
parameter envir     = 5'b11100;

//Immediate types
parameter i_imm = 3'd1;
parameter s_imm = 3'd2;
parameter b_imm = 3'd3;
parameter u_imm = 3'd4;
parameter j_imm = 3'd5;

always @(Instruction, BrEq, BrLT) begin
    case (OpCode)
        r_type: begin
            ALU_Op  = {r_funct7, funct3};
            A_Sel   = 0;
            B_Sel   = 0;
            Imm_Sel = 0;
            Reg_WEn = 1;
            Mem_RW  = 0;
            WB_Sel  = 2'b01;//write back alu
            PC_Sel  = 0;
            Br_Un   = 0;
            IF_flush= 0;
            ID_flush= 0;
            EX_flush= 0;
            end
        i_type: begin
            ALU_Op  = {i_funct7, funct3};
            A_Sel   = 0;
            B_Sel   = 1;
            Imm_Sel = i_imm;
            Reg_WEn = 1;
            Mem_RW  = 0;
            WB_Sel  = 2'b01; //write back alu
            PC_Sel  = 0;
            Br_Un   = 0;
            IF_flush= 0;
            ID_flush= 0;
            EX_flush= 0;
            end
        load: begin
            ALU_Op  = 4'd0;
            A_Sel   = 0;
            B_Sel   = 1;
            Imm_Sel = i_imm;
            Reg_WEn = 1;
            Mem_RW  = 0;
            WB_Sel  = 2'b0; //write back mem
            PC_Sel  = 0;
            Br_Un   = 0;
            IF_flush= 0;
            ID_flush= 0;
            EX_flush= 0;
            end
        store: begin
            ALU_Op  = 4'd0;
            A_Sel   = 0;
            B_Sel   = 1;
            Imm_Sel = s_imm;
            Reg_WEn = 0;
            Mem_RW  = 1;
            WB_Sel  = 0; //dont care
            PC_Sel  = 0;
            Br_Un   = 0;
            IF_flush= 0;
            ID_flush= 0;
            EX_flush= 0;
            end
        b_type: begin
            ALU_Op  = 4'd0;
            A_Sel   = 1;
            B_Sel   = 1;
            Imm_Sel = b_imm;
            Reg_WEn = 0;
            Mem_RW  = 0;
            WB_Sel  = 0;
            if (funct3 == 3'b000)
                PC_Sel = BrEq;          //beq
            else if (funct3 == 3'b001)
                PC_Sel = ~BrEq;         //bne
            else if (funct3 == 3'b100 || funct3 == 3'b110)
                PC_Sel = BrLT;          //blt & bltu
            else if (funct3 == 3'b101 || funct3 == 3'b111)
                PC_Sel = ~BrLT | BrEq;  //bge 
            else PC_Sel = 0;
            Br_Un   = funct3[1];
            IF_flush= 0;
            ID_flush= 0;
            EX_flush= 0;
            end
    /*    r_type: begin
            ALU_Op  = 0;
            A_Sel   = 0;
            B_Sel   = 0;
            Imm_Sel = 0;
            Reg_WEn = 0;
            Mem_RW  = 0;
            WB_Sel  = 0;
            PC_Sel  = 0;
            Br_Un   = 0;
            IF_flush= 0;
            ID_flush= 0;
            EX_flush= 0;
            end
        r_type: begin
            ALU_Op  = 0;
            A_Sel   = 0;
            B_Sel   = 0;
            Imm_Sel = 0;
            Reg_WEn = 0;
            Mem_RW  = 0;
            WB_Sel  = 0;
            PC_Sel  = 0;
            Br_Un   = 0;
            IF_flush= 0;
            ID_flush= 0;
            EX_flush= 0;
            end
        r_type: begin
            ALU_Op  = 0;
            A_Sel   = 0;
            B_Sel   = 0;
            Imm_Sel = 0;
            Reg_WEn = 0;
            Mem_RW  = 0;
            WB_Sel  = 0;
            PC_Sel  = 0;
            Br_Un   = 0;
            IF_flush= 0;
            ID_flush= 0;
            EX_flush= 0;
            end
        r_type: begin
            ALU_Op  = 0;
            A_Sel   = 0;
            B_Sel   = 0;
            Imm_Sel = 0;
            Reg_WEn = 0;
            Mem_RW  = 0;
            WB_Sel  = 0;
            PC_Sel  = 0;
            Br_Un   = 0;
            IF_flush= 0;
            ID_flush= 0;
            EX_flush= 0;
            end
        r_type: begin
            ALU_Op  = 0;
            A_Sel   = 0;
            B_Sel   = 0;
            Imm_Sel = 0;
            Reg_WEn = 0;
            Mem_RW  = 0;
            WB_Sel  = 0;
            PC_Sel  = 0;
            Br_Un   = 0;
            IF_flush= 0;
            ID_flush= 0;
            EX_flush= 0;
            end*/
    endcase
 end
endmodule
