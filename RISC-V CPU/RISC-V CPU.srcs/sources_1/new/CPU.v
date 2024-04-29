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
wire [31:0] PC_o, PC_i;
wire [31:0] InstructionAddress, LoadAddress;
wire IF_flush, Load;

// IF/ID Wires

// ID Wires

// ID/EX Wires

// EX Wires

// EX/MEM Wires

// MEM Wires

// MEM/WB Wires

// WB Wires

//////////////////      IF Stage        ////////////////////////////
reg_32bit   PC(PC_o, PC_i, IF_flush, reset, clk);

add_4       PC_Incrementer(PC_o, PC_i);
mux2to1     Address_mux(InstructionAddress, PC_o, LoadAddress, Load);



//////////////////      IF/ID Stage	    ////////////////////////////


//////////////////      ID Stage        ////////////////////////////


//////////////////      ID/EX Stage	    ////////////////////////////


//////////////////      EX Stage        ////////////////////////////


//////////////////      EX/MEM Stage    ////////////////////////////


//////////////////      MEM Stage       ////////////////////////////


//////////////////      MEM/WB Stage	////////////////////////////


//////////////////      WB Stage        ////////////////////////////


endmodule
