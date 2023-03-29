`timescale 1ps/1ps

module fsm_q3a_tb;

    reg  clk;
    reg  reset;
    reg  s;
    reg  w;

    wire z;

    integer i;

    fsm_q3a inst1 (clk, reset, s, w, z);

    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 0;
        #10 reset = 1;
        #10 reset = 0;
    end

    initial begin
        #20 s = 0;
        #20 s = 1;
    end

    initial begin
        #50 w = 1;
        
        for (i = 0; i < 100; i = i + 1) begin
            #10 w = $random % 2;
        end

        $finish;
    end
    initial begin
        $dumpfile("fsm_q3.vcd");
        $dumpvars(0, fsm_q3_tb);
    end

    initial begin
        $display("clk\treset\ts\tw\tz");
        $monitor("%b\t%b\t%b\t%b\t%b", clk, reset, s, w, z, $time);
    end

endmodule