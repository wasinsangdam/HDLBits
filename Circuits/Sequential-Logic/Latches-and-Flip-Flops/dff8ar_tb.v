module dff8ar_tb;

    reg          clk;
    reg          areset;
    reg  [7 : 0] d;

    wire [7 : 0] q;

    integer i;

    dff8ar inst1 (clk, areset, d, q);

    initial begin
        $dumpfile("dff8ar.vcd");
        $dumpvars(0, dff8ar_tb);
    end

    initial begin
        $display("clk\tareset\td\tq");
        $monitor("%b\t%b\t%b\t%b", clk, areset, d, q, $time);
    end

    initial clk <= 0;

    always #5 clk = ~clk;

    initial begin
        areset <= 0;

        #5 areset <= 1;
        #5 areset <= 0;
        #50 areset <= 1;
        #20 areset <= 0;
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