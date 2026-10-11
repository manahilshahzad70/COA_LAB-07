module full_adder_gl(
    input a, b, cin,
    output sum, cout
);

    wire x1, t1, t2;

    xor (x1, a, b);
    xor (sum, x1, cin);
    and (t1, a, b);
    and (t2, x1, cin);
    or  (cout, t1, t2);

endmodule


module mux4_gl(
    input d0, d1, d2, d3,
    input s1, s0,
    output y
);

    wire ns1, ns0, w0, w1, w2, w3;

    not (ns1, s1);
    not (ns0, s0);

    and (w0, d0, ns1, ns0);
    and (w1, d1, ns1, s0);
    and (w2, d2, s1, ns0);
    and (w3, d3, s1, s0);

    or (y, w0, w1, w2, w3);

endmodule


module alu1_structural(
    input a, b, cin, binv,
    input [1:0] sel,
    output result, cout
);

    wire nb, nbinv, t1, t2;
    wire bx, sum, carry_raw;
    wire and_o, or_o;

   
    not (nb, b);
    not (nbinv, binv);
    and (t1, b, nbinv);
    and (t2, nb, binv);
    or  (bx, t1, t2);

    
    and (and_o, a, b);
    or  (or_o, a, b);

    
    full_adder_gl fa(
        .a(a), .b(bx), .cin(cin),
        .sum(sum), .cout(carry_raw)
    );

    
    mux4_gl mux(
        .d0(and_o), .d1(or_o),
        .d2(sum), .d3(1'b0),
        .s1(sel[1]), .s0(sel[0]),
        .y(result)
    );

    
    assign cout = (sel == 2'b10) ? carry_raw : 1'b0;

endmodule


module tb_alu1_structural;

reg a, b, cin, binv;
reg [1:0] sel;
wire result, cout;

alu1_structural uut(a, b, cin, binv, sel, result, cout);

initial
begin
    
    sel = 2'b00; binv = 0; cin = 0;
    a = 0; b = 0;
    #50 a = 0; b = 1;
    #50 a = 1; b = 0;
    #50 a = 1; b = 1;

    // OR operation
    #50 sel = 2'b01; a = 0; b = 0;
    #50 a = 0; b = 1;
    #50 a = 1; b = 0;
    #50 a = 1; b = 1;

    // ADD operation
    #50 sel = 2'b10; binv = 0; cin = 0;
    a = 0; b = 0;
    #50 a = 0; b = 1;
    #50 a = 1; b = 0;
    #50 a = 1; b = 1;

    // SUB operation
    #50 sel = 2'b10; binv = 1; cin = 1;
    a = 0; b = 0;
    #50 a = 0; b = 1;
    #50 a = 1; b = 0;
    #50 a = 1; b = 1;

    // Unused selection
    #50 sel = 2'b11; a = 1; b = 1;

    #50 $finish;
end

endmodule
