module Ex3ToBin(B, E);
output [3:0] B;
input [3:0] E;
wire w1, w2, w3, w4, w5, w6, w7, w8, w9;

not n1(B[0], E[0]);
xor x1(B[1], E[1], E[0]);
and a1(w1, E[0], E[1], E[2]);
not n2(w2, E[1]);
not n3(w3, E[2]);
and a3(w4, w2, w3);
not n4(w5, E[2]);
not n5(w6, E[0]);
and a4(w7, w5, w6);
or o1(B[2], w1, w4, w7);
and a5(w8, E[3], E[2]);
and a6(w9, E[0], E[1], E[3]);
or o2(B[3], w8, w9);

endmodule


module testBench;
reg [3:0] E;
wire [3:0] B;

Ex3ToBin ex3tobin(B, E);

initial
begin
#0  E=4'd3;
#100 E=4'd4;
#100 E=4'd5;
#100 E=4'd6;
#100 E=4'd7;
#100 E=4'd8;
#100 E=4'd9;
#100 E=4'd10;
#100 E=4'd11;
#100 E=4'd12;
#100 E=4'd13;
#100 E=4'd14;
#100 E=4'd15;
end

endmodule
