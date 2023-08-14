module Mod_10_Counter(q, j, k, clk);
output [3:0] q;
input j, k, clk;
wire gb0, gb1, gb2, gb3;
wire w1, w2;

jk_ff ff0(q[0], gb0, j, k, clk, w1);
jk_ff ff1(q[1], gb1, j, k, q[0], w1);
jk_ff ff2(q[2], gb2, j, k, q[1], w1);
jk_ff ff3(q[3], gb3, j, k, q[2], w1);
nand n(w1, q[1], q[3]);

endmodule

module jk_ff(q, qb, j, k, clk, clear);
output q, qb;
input j, k, clk, clear;
wire w1, w2, w3, w4, w5, w6, clkb;

nand n1(w1, j, clk, qb, clear);
nand n2(w2, k, clk, q);
nand n3(w3, w1, w4);
nand n4(w4, w2, w3, clear);
not nt(clkb, clk);
nand n5(w5, w3, clkb);
nand n6(w6, w4, clkb);
nand n7(q, w5, qb);
nand n8(qb, w6, q, clear);

endmodule
