module dff3_tb;

    reg          clk;
    reg          d;
    reg          r;

    wire         q;

    integer i;

    dff3 inst1 (clk, d, r, q);

    initial begin
        $dumpfile("dff3.vcd");
        $dumpvars(0, dff3_tb);
    end

    initial begin
        $display("clk\td\tr\tq");
        $monitor("%b\t%b\t%b\t%b", clk, d, r, q, $time);
    end

    initial clk = 0;

    always #5 clk = ~clk;

    initial begin
        r = 0;
        #10 r = 1;
        #10 r = 0;

        #80 r = 1;
        #20 r = 0;
    end


    initial begin
        d = 0;
        
        for (i = 0; i < 32; i = i + 1) begin
            #10
            d = $random;
        end

        $finish;
    end
    

endmodule