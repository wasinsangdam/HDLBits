module dlatch_tb;

    reg          d;
    reg          ena;

    wire         q;

    integer i;

    dlatch inst1 (d, ena, q);

    initial begin
        $dumpfile("dlatch.vcd");
        $dumpvars(0, dlatch_tb);
    end

    initial begin
        $display("d\tena\tq");
        $monitor("%b\t%b\t%b", d, ena, q, $time);
    end

    initial begin
        d <= 0; ena <= 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            d <= $random;
            ena <= $random % 2;
        end
    end

        

endmodule