module alu1_behavioral(
    input a, b, cin, binv,
    input [1:0] sel,
    output reg result, cout
);

    reg bx;
    reg [1:0] arithmetic;

    always @(*) begin

        bx = b ^ binv;
        arithmetic = {1'b0, a} + {1'b0, bx} + cin;

        result = 1'b0;
        cout   = 1'b0;

        case (sel)
            2'b00: result = a & b;
            2'b01: result = a | b;

            2'b10: begin
                result = arithmetic[0];
                cout   = arithmetic[1];
            end

            2'b11: begin
                result = 1'b0;
                cout   = 1'b0;
            end
        endcase

    end

endmodule
module tb_alu1_behavioral;

reg a, b, cin, binv;
reg [1:0] sel;
wire result, cout;

alu1_behavioral uut(a, b, cin, binv, sel, result, cout);

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
