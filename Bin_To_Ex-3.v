module BinToEx3(E, B);
output [3:0] E;
input [3:0] B;
wire w1, w2, w3;

not n1(E[0], B[0]);
xor x1(w3, B[1], B[0]);
not n2(E[1], w3);
or o1(w1, B[0], B[1]);
xor x2(E[2], w1, B[2]);
and a1(w2, w1, B[2]);
or o2(E[3], B[3], w2);

endmodule


module TestBench;
reg [3:0] B;
wire [3:0] E;

BinToEx3 bintoex3(E, B);

/*initial
$monitor("%d\n", E);*/

initial
begin
#0 B=4'd0;
#100 B=4'd1;
#100 B=4'd2;
#100 B=4'd3;
#100 B=4'd4;
#100 B=4'd5;
#100 B=4'd6;
#100 B=4'd7;
#100 B=4'd8;
#100 B=4'd9;
#100 B=4'd10;
#100 B=4'd11;
#100 B=4'd12;
#100 B=4'd13;
#100 B=4'd14;
end

endmodule
