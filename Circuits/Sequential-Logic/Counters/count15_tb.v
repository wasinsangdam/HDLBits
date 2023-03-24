module count15_tb;

    reg          clk;
    reg          reset;

    wire [3 : 0] q;

    count15 inst1 (clk, reset, q);

    initial begin
        $dumpfile("count15.vcd");
        $dumpvars(0, count15_tb);
    end

    initial begin
        $display("clk\treset\tq");
        $monitor("%b\t%b\t%b", clk, reset, q, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;

        #10 reset = 1;
        #10 reset = 0;

        #150 reset = 1;
        #10  reset = 0;
        #100 reset = 1;
        #10  reset = 0;
    end

    initial begin
        #500 $finish;
    end

endmodule