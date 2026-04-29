module mac_unit (
    input clk,
    input reset, 
    input en,
    input [15:0] A,
    input [15:0] B,
    output reg [31:0] acc
);

wire [31:0] mult_result = A * B;

always @(posedge clk) begin
    if (reset) begin
        acc <= 0;
    end else if (en) begin
        acc <= acc + mult_result;
    end
end

e