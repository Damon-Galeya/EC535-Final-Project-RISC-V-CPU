`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 03:29:22 AM
// Design Name: 
// Module Name: ALU
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


module ALU(op, a, b, out);

input   [3:0]   op; 
input   [31:0]  a;
input   [31:0]  b;

output  reg [31:0]  out;

always @(op, a, b) begin
    case(op)
        4'b0000:    out = a + b; //add
        4'b1000:    out = a - b; //sub
        4'b0111:    out = a & b; //and
        4'b0110:    out = a | b; //or
        4'b0100:    out = a ^ b; //xor
        4'b0001:    out = a << b[4:0]; //sll
        4'b0101:    out = a >> b[4:0]; //srl
        4'b1101:    out = $signed(a) >>> b[4:0]; //sra (fix to make shift right arithmnetic)
        4'b0011:    out = a < b; //sltu
        4'b0010:    begin 
                    if (a[31] != b[31])
                        out = a[31];
                    else 
                        out = a < b;
                    end             
        default:    out = 32'd0;         
    endcase
end

endmodule
