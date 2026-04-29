module cpu (
    input clk,
    input reset,
    input done,
    input [31:0] read_data,
    output [7:0] instruction,
    output [7:0] pc,
    output [3:0] answer, 
    output reg [15:0] addr,
    output reg [31:0] write_data,
    output reg write_enable
);

reg [31:0] result_reg;
reg [3:0] state;
wire [7:0] next_pc;

always @(posedge clk) begin
    if (reset) begin
        state <= 0;
        write_enable <= 0;
        addr <= 0;
        write_data <= 0;
        result_reg <= 0;