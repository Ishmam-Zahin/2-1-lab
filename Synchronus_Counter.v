module Synchronus_Counter(q, clk, clear);
output [3:0] q;
input clk, clear;
wire [3:0] t, qbar;

T_FF tff0(q[0], qbar[0], t[0], clk, clear);
T_FF tff1(q[1], qbar[1], t[1], clk, clear);
T_FF tff2(q[2], qbar[2], t[2], clk, clear);
T_FF tff3(q[3], qbar[3], t[3], clk, clear);
and (w1, qbar[1], q[0]);
and (w2, q[3], qbar[2], q[0]);
and (w3, q[3], q[2], q[1], qbar[0]);
or (t[0], w1, w2, w3);
and (w4, qbar[2], q[1]);
and (w5, qbar[3], q[1], qbar[0]);
and (w6, q[3], q[2], qbar[1], qbar[0]);
or (t[1], w4, w5, w6);
and (w7, qbar[3], q[2]);
and (w8, q[2], qbar[1], q[0]);
and (w9, q[3], qbar[2], qbar[1], qbar[0]);
or (t[2], w7, w8, w9);
and (w10, q[3], q[0]);
and (w11, q[3], qbar[2], q[1]);
and (w12, qbar[3], qbar[2], qbar[1], qbar[0]);
or (t[3], w10, w11, w12);

endmodule

module T_FF(q, qbar, t, clk, clear);
input t, clk, clear;
output q, qbar;

JK_FF jkff1(q, qbar, t, t, clk, clear);

endmodule

module JK_FF(q, qbar, j, k, clk, clear);
output q, qbar;
input j, k, clk, clear;
wire w1, w2, w3, w4, w5, w6, clkb;

nand n1(w1, j, clk, qbar, clear);
nand n2(w2, k, clk, q);
nand n3(w3, w1, w4);
nand n4(w4, w2, w3, clear);
not nt(clkb, clk);
nand n5(w5, w3, clkb);
nand n6(w6, w4, clkb);
nand n7(q, w5, qbar);
nand n8(qbar, w6, q, clear);

endmodule
