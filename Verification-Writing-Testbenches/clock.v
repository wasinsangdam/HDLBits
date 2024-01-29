module clock (
    input   clk
);
    reg       clk;
    dut inst1(clk);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
    end


endmodule