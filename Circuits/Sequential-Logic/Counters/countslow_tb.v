`timescale 1ps/1ps

module countslow_tb;

    reg          clk;
    reg          slowena;
    reg          reset;

    wire [3 : 0] q;

    countslow inst1 (clk, slowena, reset, q);

    initial begin
        $dumpfile("countslow.vcd");
        $dumpvars(0, countslow_tb);
    end

    initial begin
        $display("clk\tslowena\treset\tq");
        $monitor("%b\t%b\t%b\t%b", clk, slowena, reset, q, $time);
    end

    always #5 clk = ~clk;

    initial begin
        slowena = 1;
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
        #15 slowena = 0;
        #15 slowena = 1;
        #10 slowena = 0;
        #10 slowena = 1;
        #10 slowena = 0;
        #10 slowena = 1;
        #40 slowena = 0;
        #40 slowena = 1;
        #140 slowena = 0;
        #20 slowena = 1;
        
    end


    initial begin
        #500 $finish;
    end

endmodule