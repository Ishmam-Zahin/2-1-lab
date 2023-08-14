module full_adder(s, cout, a, b, cin);
input a, b, cin;
output s, cout;

xor (w1, a, b);
xor (s, w1, cin);
and (w2, a, b);
and (w3, w1, cin);
or (cout, w3, w2);

endmodule

module four_bit_full_adder(s, cout, a, b, cin);
input [3:0] a, b;
input cin;
output [3:0] s;
output cout;

full_adder fadd0(s[0], c1, a[0], b[0], cin);
full_adder fadd1(s[1], c2, a[1], b[1], c1);
full_adder fadd2(s[2], c3, a[2], b[2], c2);
full_adder fadd3(s[3], cout, a[3], b[3], c3);

endmodule

module bcd_4_bit_full_adder(s, cout, a, b, cin1, cin2);
input [3:0] a, b;
input cin1, cin2;
output [3:0] s;
output cout;
wire [3:0] ts, tb;
wire tcout, w1, w2, w3, trash;

four_bit_full_adder ffadd1(ts, tcout, a, b, cin1);
and (w1, ts[3], ts[2]);
and (w2, ts[3], ts[1]);
or (w3, w1, w2);
or (cout, w3, tcout);
or (tb[0], 0, 0);
or (tb[1], 0, cout);
or (tb[2], 0, cout);
or (tb[3], 0, 0);
four_bit_full_adder ffadd2(s, trash, ts, tb, cin2);

endmodule

module test_bcd_adder;
reg [3:0] a, b;
reg cin1, cin2;
wire [3:0] s;
wire cout;

bcd_4_bit_full_adder b4bfa(s, cout, a, b, cin1, cin2);

initial
begin
cin1=1'b0; cin2=1'b0; a=4'd4; b=4'd6;
#100 a=4'd9; b=4'd4;
#100 a=4'd1; b=4'd3;
#100 a=4'd2; b=4'd2;
#100 a=4'd5; b=4'd3;
#100 a=4'd9; b=4'd10;
end

endmodule

