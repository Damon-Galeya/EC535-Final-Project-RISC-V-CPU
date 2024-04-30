`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 04:45:19 AM
// Design Name: 
// Module Name: CPU
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


module CPU(out, Instruction, LoadInstruction, reset, clk);

input   [31:0]  Instruction;
input           LoadInstruction;
input           reset;
input           clk;

output  [31:0]  out;

// IF Wires
wire    [31:0]  PC_o, PC_i, PC_plus4, Instruction_o;
wire    [31:0]  InstructionAddress, LoadAddress;
wire            IF_flush, PC_Write, PC_Select;

// IF/ID Wires
wire    [31:0]  IDEX_PC, IDEX_IR;

// ID Wires

wire [4:0] OpCode; //for when i decide to fix the control
wire [2:0] Funct3;
wire [6:0] Funct7;
assign OpCode = IDEX_IR[6:2];
assign Funct3 = IDEX_IR[14:12];
assign Funct7 = IDEX_IR[31:25];

wire [2:0]ALU_Op;
wire [2:0]Immediate_Select;
wire A_Select, B_Select;
wire Branch_Unsigned, Branch_Equal, Branch_LessThan;
wire RegWrite_Enable, Mem_ReadWrite;
wire ID_flush;

wire [4:0] ReadReg2, ReadReg1, WriteRegister;
assign WriteRegister = IDEX_IR[11:7];
assign ReadReg1 = IDEX_IR[19:15];
assign ReadReg2 = IDEX_IR[24:20];

wire [31:0] Immediate;
// ID/EX Wires

wire EX_flush;
// EX Wires
wire [31:0] ALU_o;

// EX/MEM Wires

// MEM Wires

// MEM/WB Wires

// WB Wires
wire [31:0] WriteBackData;
wire [1:0]WB_Select;


//////////////////      IF Stage        ////////////////////////////
reg_32bit   PC(PC_o, PC_i, IF_flush, reset, clk);
memory      InstructionMemory(Instruction_o, Instruction, PC_o, PC_Select, 1'b1, clk); //turn into cache later if time

add_4       PC_Incrementer(PC_plus4, PC_o);
mux2to1     Address_mux(InstructionAddress, PC_plus4, ALU_o, PC_Select);

//////////////////      IF/ID Stage	    ////////////////////////////
reg_32bit   IFID_PCreg(IDEX_PC, PC_plus4, IFID_enable, IF_flushORreset, clk);
or          flushor(IF_flushORreset, IF_flush, reset);
reg_32bit   IFID_IRreg(IDEX_IR, Instruction_o, IFID_enable, IF_flushORreset, clk);

//////////////////      ID Stage        ////////////////////////////
Control     PipeControl(PC_Select, Immediate_Select, RegWrite_Enable, Branch_Unsigned, A_Select, B_Select, ALU_Op, Mem_ReadWrite, WB_Select, IF_flush, ID_flush, EX_flush, IDEX_IR, Branch_Equal, Branch_LessThan); //rework the control if time

RegFile     RegisterFile(clk, reset, WriteBackData, WriteRegister, RegWrite_Enable, ReadReg1, ReadReg2, Reg_SrcA, Reg_SrcB);
compare_32bit BranchCompare(Branch_LessThan, Branch_Equal, Reg_SrcA, Reg_SrcB, Branch_Unsigned);

Immediate_Picker imm(Immediate, IDEX_IR[31:7], Immediate_Select);



//////////////////      ID/EX Stage	    ////////////////////////////


//////////////////      EX Stage        ////////////////////////////


//////////////////      EX/MEM Stage    ////////////////////////////


//////////////////      MEM Stage       ////////////////////////////


//////////////////      MEM/WB Stage	////////////////////////////


//////////////////      WB Stage        ////////////////////////////


endmodule
