module mac_unit (
    input clk,
    input reset, 
    input en,
    input [15:0] A,
    input [15:0] B,
    output reg [31:0] acc
);

wire [31:0] mult_result = A * B;

always @(posedge clock) begin
    if (reset) 
        acc <= 0
    else if (en) begin
        acc <= acc + mult_result;
    end
end

endmodule