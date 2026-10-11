module alu1(
    input a, b, cin, binv, less,
    input [1:0] op,
    output result, cout, sum
);

wire bx;

assign bx = b ^ binv;

assign sum = a ^ bx ^ cin;
assign cout = (a & bx) | (a & cin) | (bx & cin);

assign result = (op == 2'b00) ? (a & b) :
                (op == 2'b01) ? (a | b) :
                (op == 2'b10) ? sum : less;

endmodule


module alu4(
    input [3:0] a, b,
    input binv,
    input [1:0] op,
    output [3:0] result,
    output cf, sf, zf, of
);

wire [4:0] c;
wire [3:0] sum;
wire sub, overflow, less;

assign sub = binv | (op == 2'b11);
assign c[0] = sub;

alu1 u0(a[0], b[0], c[0], sub, less,
        op, result[0], c[1], sum[0]);

alu1 u1(a[1], b[1], c[1], sub, 1'b0,
        op, result[1], c[2], sum[1]);

alu1 u2(a[2], b[2], c[2], sub, 1'b0,
        op, result[2], c[3], sum[2]);

alu1 u3(a[3], b[3], c[3], sub, 1'b0,
        op, result[3], c[4], sum[3]);

assign overflow = c[3] ^ c[4];
assign less = sum[3] ^ overflow;

assign cf = (op == 2'b10) ? c[4] : 1'b0;
assign of = (op == 2'b10) ? overflow : 1'b0;
assign sf = result[3];
assign zf = (result == 4'b0000);

endmodule


module tb_alu4;

reg [3:0] a, b;
reg binv;
reg [1:0] op;

wire [3:0] result;
wire cf, sf, zf, of;

alu4 uut(a, b, binv, op, result, cf, sf, zf, of);

initial
begin
    op = 2'b00; binv = 0;
    a = 4'b1100; b = 4'b1010;
    #50;

    op = 2'b01;
    #50;

    op = 2'b10; binv = 0;
    a = 4'b0011; b = 4'b0100;
    #50;

    a = 4'b1111; b = 4'b0001;
    #50;
    binv = 1;
    a = 4'b0101; b = 4'b0011;
    #50;
    
    a = 4'b0101; b = 4'b0101;
    #50;
    
    op = 2'b11; binv = 0;
    a = 4'b0011; b = 4'b0101;
    #50;
    
    a = 4'b0101; b = 4'b0011;
    #50;

    a = 4'b1000; b = 4'b0001;
    #50;

    $finish;
end

endmodule