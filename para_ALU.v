module alu_param #(parameter N = 8) (
    input [N-1:0] a, b,
    input [2:0] ctrl,
    output reg [N-1:0] result,
    output reg carry_out,
    output zero
);

always @(*) begin
    result = {N{1'b0}};
    carry_out = 1'b0;

    case (ctrl)
        3'b000: begin
            {carry_out, result} = {1'b0, a} + {1'b0, b};
        end

        3'b001: begin
            result = a - b;
            carry_out = (a < b);
        end

        3'b010: result = a & b;
        3'b011: result = a | b;
        3'b100: result = ~a;
        3'b101: result = a ^ b;

        default: begin
            result = {N{1'b0}};
            carry_out = 1'b0;
        end
    endcase
end

assign zero = (result == {N{1'b0}});

endmodule


module tb_alu_param;

parameter N = 4;

reg [N-1:0] a, b;
reg [2:0] ctrl;
wire [N-1:0] result;
wire carry_out, zero;

alu_param #(.N(N)) uut (
    .a(a),
    .b(b),
    .ctrl(ctrl),
    .result(result),
    .carry_out(carry_out),
    .zero(zero)
);

initial begin
    ctrl = 3'b000; a = 5;  b = 3;  #50;
    ctrl = 3'b001; a = 5;  b = 3;  #50;
    ctrl = 3'b010; a = 12; b = 10; #50;
    ctrl = 3'b011; a = 12; b = 10; #50;
    ctrl = 3'b100; a = 12; b = 0;  #50;
    ctrl = 3'b101; a = 12; b = 10; #50;

    ctrl = 3'b000; a = 15; b = 1;  #50;
    ctrl = 3'b001; a = 5;  b = 5;  #50;
    ctrl = 3'b001; a = 3;  b = 5;  #50;

end

endmodule
