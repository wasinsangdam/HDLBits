`timescale 1ps/1ps

module fsm1_async_reset_tb;

    reg          clk;
    reg          areset;
    reg          in;

    wire         out;

    fsm1_async_reset inst1 (clk, areset, in, out);

    initial begin
        $dumpfile("fsm1_async_reset.vcd");
        $dumpvars(0, fsm1_async_reset_tb);
    end

    initial begin
        $display("clk\tareset\tin\tout");
        $monitor("%b\t%b\t%b\t%b", clk, areset, in, out, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        areset = 0;

        #10 areset = 1;
        #10 areset = 0;
    end

    initial begin
        in = 0;
        
        #10 in = 1;
        #100 in = 0;
        #100 in = 1;
    end

    initial #500 $finish;
    
endmodule