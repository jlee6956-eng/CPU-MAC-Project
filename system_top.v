module system_top (
    input wire clk,
    input wire reset
);

wire [7:0] instruction_unused;
wire [7:0] pc_unused;
wire [3:0] answer_unused;

wire [15:0] addr;
wire [31:0] write_data;
wire write_enable;

wire [31:0] result;
wire done;

cpu cpu_inst (
    .clk(clk),
    .reset(reset),
    .done(done),
    .read_data(result),
    .instruction(instruction_unused),
    .pc(pc_unused),
    .answer(answer_unused),
    .addr(ad