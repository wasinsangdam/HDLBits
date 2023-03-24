module dff8p_tb;

    reg          clk;
    reg          reset;
    reg  [7 : 0] d;

    wire [7 : 0] q;

    integer i;

    dff8p inst1 (clk, reset, d, q);

    initial begin
        $dumpfile("dff8p.vcd");
        $dumpvars(0, dff8p_tb);
    end

    initial begin
        $display("clk\treset\td\tq");
        $monitor("%b\t%b\t%b\t%b", clk, reset, d, q, $time);
    end

    initial clk <= 0;

    always #5 clk = ~clk;

    initial begin
        reset <= 0;

        #10 reset <= 1;
        
        #20 reset <= 0;

        #50 reset <= 1;

        #20 reset <= 0;
    end

    initial begin
        d <= 0;

        for (i = 0; i < 32; i = i + 1) begin
            #10
            d <= $random;
        end

        $finish;
    end


endmodule