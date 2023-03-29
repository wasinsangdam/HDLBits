module count10_tb;

    reg          clk;
    reg          reset;

    wire [3 : 0] q;

    count10 inst1 (clk, reset, q);

    initial begin
        $dumpfile("count10.vcd");
        $dumpvars(0, count10_tb);
    end

    initial begin
        $display("clk\treset\tq");
        $monitor("%b\t%b\t%b", clk, reset, q, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
    end

    initial begin
        #10 reset = 1;
        #10 reset = 0;

        #40 reset = 1;
        #10 reset = 0;

        #120 reset = 1;
        #10  reset = 0;
    end

    initial begin
        #500 $finish;
    end
    

endmodule