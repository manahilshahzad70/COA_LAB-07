module alu1_dataflow(
    input a, b, cin, binv,
    input [1:0] sel,
    output result, cout
);

    wire bx, sum, carry;

    assign bx    = b ^ binv;

    assign sum   = a ^ bx ^ cin;
    assign carry = (a & bx) | (a & cin) | (bx & cin);

    assign result = (sel == 2'b00)?(a & b) :
                    (sel == 2'b01)?(a | b) :
                    (sel == 2'b10)?sum : 1'b0;

    assign cout = (sel == 2'b10) ? carry : 1'b0;

endmodule

module tb_alu1_dataflow;

reg a, b, cin, binv;
reg [1:0] sel;
wire result, cout;

alu1_dataflow uut(a, b, cin, binv, sel, result, cout);

initial
begin
    sel = 2'b00; binv = 0; cin = 0;
    a = 0; b = 0;
    #50 a = 0; b = 1;
    #50 a = 1; b = 0;
    #50 a = 1; b = 1;

   
    #50 sel = 2'b01; a = 0; b = 0;
    #50 a = 0; b = 1;
    #50 a = 1; b = 0;
    #50 a = 1; b = 1;

    
    #50 sel = 2'b10; binv = 0; cin = 0;
    a = 0; b = 0;
    #50 a = 0; b = 1;
    #50 a = 1; b = 0;
    #50 a = 1; b = 1;

    
    #50 sel = 2'b10; binv = 1; cin = 1;
    a = 0; b = 0;
    #50 a = 0; b = 1;
    #50 a = 1; b = 0;
    #50 a = 1; b = 1;

    
    #50 sel = 2'b11; a = 1; b = 1;

    #50 $finish;
end

endmodule
