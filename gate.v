module gate (input [3:0] a, b,
              output [3:0] y1, y2,y3,y4,y5);

assign y1 = a & b; //and
assign y2 = a | b; //or
assign y3 = a ^ b; //xor
assign y4 = ~(a & b); //nand
assign y5 = ~(a | b); //nor

endmodule
