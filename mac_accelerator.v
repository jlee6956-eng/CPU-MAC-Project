module mac_accelerator (
    input wire clk,
    input wire reset,

    input wire [31:0] write_data,
    input wire [15:0] addr,
    input wire write_enable,
    input wire read_enable,

    output reg [31:0] result,      // final accumulated result
    output reg done                // signals computation finished
);

reg start_reg;
reg [31:0] A_reg;
reg [31:0] B_reg;
reg en;


reg [1:0] state;
localparam IDLE = 2'b00;
localparam COMPUTE = 2'b01;
localparam DONE = 2'b10;


wire [31:0] acc_wire;

mac_unit mac_inst (
    .clk(clk),
    .reset(reset),
    .en(en),
    .A(A_reg[15:0]),
    .B(B_reg[15:0]),
    .acc(acc_wire)
);

always @(posedge clk) begin
    if (reset) begin
        A_reg <= 0;
        B_reg <= 0;
        start_reg <= 0;
    end else if (write_enable) begin
        case (addr) 
            16'h1000: A_reg <= write_data;
            16'h1004: B_reg <= write_data;
            16'h1008: start_reg <= write_data[0];
        endcase
    end
end


always @(posedge clk) begin
    if (reset) begin
        result <= 0;
        done <= 0;
        en <= 0;
        state <= IDLE;
    end else begin
        case (state)
            IDLE: begin
                done <= 0;
                en <= 0;
                if (start_reg) begin
                    start_reg <= 0;   // clear start
                    en <= 1;
                    state <= COMPUTE;
                end
            end

            COMPUTE: begin
                en <= 1;
                state <= DONE;
            end

            DONE: begin
                en <= 0;
                done <= 1;
                result <= acc_wire;
                state <= IDLE;
            end

        endcase
    end
end

endmodule

