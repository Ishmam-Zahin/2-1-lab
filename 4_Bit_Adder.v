module four_bit_adder(s, cout, a, b, cin);
input [3:0] a, b;
input cin;
output [3:0] s;
output cout;

Full_Adder fadd0(s[0], c0, a[0], b[0], cin);
Full_Adder fadd1(s[1], c1, a[1], b[1], c0);
Full_Adder fadd2(s[2], c2, a[2], b[2], c1);
Full_Adder fadd3(s[3], cout, a[3], b[3], c2);

endmodule

module Full_Adder(s, cout, a, b, cin);
input a, b, cin;
output s, cout;
xor (o1, a, b);
xor (s, o1, cin);
and (o2, o1, cin);
and (o3, a, b);
or (cout, o2, o3);

endmodule

module testt;
reg [3:0] a, b;
reg cin;
wire [3:0] s;
wire cout;
four_bit_adder fadd(s, cout, a, b, cin);

initial
begin
#0 a=4'd8; b=4'd3; cin=1'b0;
#100 a=4'd2; b=4'd2; cin=1'b0;
#100 a=4'd5; b=4'd6; cin=1'b0;
#100 a=4'd7; b=4'd4; cin=1'b0;
#100 a=4'd3; b=4'd8; cin=1'b0;
end
endmodule
