`timescale 1ps/1ps

module oneHertz_tb;

    reg          clk;
    reg          reset;

    wire         oneHertz;
    wire [2 : 0] c_enable;

    oneHertz inst1 (clk, reset, oneHertz, c_enable);

    initial begin
        $dumpfile("oneHertz.vcd");
        $dumpvars(0, oneHertz_tb);
    end

    initial begin
        $display("clk\treset\toneHertz\tc_enable");
        $monitor("%b\t%b\t%b\t%b", clk, reset, oneHertz, c_enable, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        #5 reset = 1;
        #1 reset = 0;

        #10100 $finish;
    end



endmodule