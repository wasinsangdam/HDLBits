`timescale 1ps/1ps

module fsm_serialdp_tb;

    reg  clk;
    reg  in;
    reg  reset;

    wire [7 : 0] out_byte;
    wire         done;

    fsm_serialdp inst1 (clk, in, reset, out_byte, done);

    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1'b1;
        #10 reset = 0;
    end

    initial begin
            in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;

        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;

        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;

        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;

        $finish;
    end

    initial begin
        $dumpfile("fsm_serialdp.vcd");
        $dumpvars(0, fsm_serialdp_tb);
    end

    initial begin
        $display("clk\tin\treset\tout_byte\tdone");
        $monitor("%b\t%b\t%b\t%b\t%b", clk, in, reset, out_byte, done, $time);
    end

endmodule