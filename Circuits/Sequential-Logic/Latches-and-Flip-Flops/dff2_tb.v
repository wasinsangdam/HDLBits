module dff2_tb;

    reg          clk;
    reg          d;
    reg          ar;

    wire         q;
    
    integer i;

    dff2 inst1 (clk, d, ar, q);

    initial begin
        $dumpfile("dff2.vcd");
        $dumpvars(0, dff2_tb);
    end

    initial begin
        $display("clk\td\tar\tq");
        $monitor("%b\t%b\t%b\t%b", clk, d, ar, q, $time);
    end

    initial clk = 0;

    always #5 clk = ~clk;

    initial begin
        ar = 0;
        #5 ar = 1;
        #5 ar = 0;

        #40 ar = 1;
        #5  ar = 0;
    end

    initial begin
        d <= 0;

        for (i = 0; i < 32; i = i + 1) begin
            #10
            d = $random;
        end

        $finish;
    end

endmodule