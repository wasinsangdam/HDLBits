`timescale 1ps/1ps

module fsm_hdlc_tb;

    reg  clk;
    reg  reset;
    reg  in;

    wire disc;
    wire flag;
    wire err;

    fsm_hdlc inst1 (clk, reset, in, disc, flag, err);

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
        in = 1;
        #30 in = 0;
        #10 in = 1;
        #50 in = 0;
        #20 in = 1;
        #60 in = 0;
        #30 in = 1;
        #80 in = 0;
        #50 in = 1;
        #200 $finish;
    end

    initial begin
        $dumpfile("fsm_hdlc.vcd");
        $dumpvars(0, fsm_hdlc_tb);
    end

    initial begin
        $display("clk\treset\tin\tdisc\tflag\terr");
        $monitor("%b\t%b\t%b\t%b\t%b\t%b", clk, reset, in, disc, flag, err, $time);
    end

endmodule