module tb_system;

    reg clk;
    reg reset;

    wire [31:0] result;
    wire done;

    // Instantiate your top module
    system_top uut (
        .clk(clk),
        .reset(reset)
    );

    // Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        reset = 1;

        // Release reset
        #10;
        reset = 0;

        // Let system run
        #100;

        // Print result
        $display("DONE = %d", uut.done);
        $display("RESULT = %d", uut.result);

        // Expected: RESULT = 35
        if (uut.result == 35)
            $display("PASS");
        else
            $display("FAIL");

        #20;
        $finish;
    end

endmodule