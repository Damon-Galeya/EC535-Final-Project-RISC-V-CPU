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
wire            IF_flush, is_Load;

// IF/ID Wires
wire    [31:0]  IDEX_PC, IDEX_IR;

// ID Wires

// ID/EX Wires

// EX Wires

// EX/MEM Wires

// MEM Wires

// MEM/WB Wires

// WB Wires

//////////////////      IF Stage        ////////////////////////////
reg_32bit   PC(PC_o, PC_i, IF_flush, reset, clk);
memory      InstructionMemory(Instruction_o, Instruction, PC_o, is_Load, 1'b1, clk); //turn into cache later if time

add_4       PC_Incrementer(PC_plus4, PC_o);
mux2to1     Address_mux(InstructionAddress, PC_plus4, LoadAddress, is_Load);

//////////////////      IF/ID Stage	    ////////////////////////////
reg_32bit   IFID_PCreg(IDEX_PC, PC_plus4, IFID_enable, IF_flushORreset, clk);
or          flushor(IF_flushORreset, IF_flush, reset);
reg_32bit   IFID_IRreg(IDEX_IR, Instruction_o, IFID_enable, IF_flushORreset, clk);

//////////////////      ID Stage        ////////////////////////////


//////////////////      ID/EX Stage	    ////////////////////////////


//////////////////      EX Stage        ////////////////////////////


//////////////////      EX/MEM Stage    ////////////////////////////


//////////////////      MEM Stage       ////////////////////////////


//////////////////      MEM/WB Stage	////////////////////////////


//////////////////      WB Stage        ////////////////////////////


endmodule
