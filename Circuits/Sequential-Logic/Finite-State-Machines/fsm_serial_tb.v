`timescale 1ps/1ps

module fsm_serial_tb;

    reg          clk;
    reg          in;
    reg          reset;

    wire         done;

    fsm_serial inst1 (clk, in, reset, done);

    initial begin
        $dumpfile("fsm_serial.vcd");
        $dumpvars(0, fsm_serial_tb);
    end

    initial begin
        $display("clk\tin\treset\tdone");
        $monitor("%b\t%b\t%b\t%b", clk, in, reset, done, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 1;
        reset = 1;

        #10 reset = 0;
    end

    initial begin
        in = 1;
        #20 in = 0;
        #10 in = 1;
        #90 in = 0;
        #10 in = 1;
        #110 in = 0;
        #10 in = 1;
    end

    initial #500 $finish;


endmodule