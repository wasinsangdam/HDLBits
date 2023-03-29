`timescale 1ps/1ps

module shift4_tb;

    reg          clk;
    reg          areset;
    reg          load;
    reg          ena;
    reg  [3 : 0] data;

    wire [3 : 0] q;

    shift4 inst1 (clk, areset, load, ena, data, q);

    initial begin
        $dumpfile("shift4.vcd");
        $dumpvars(0, shift4_tb);
    end

    initial begin
        $display("clk\tareset\tload\tena\tdata\tq");
        $monitor("%b\t%b\t%b\t%b\t%b\t%b", clk, areset, load, ena, data, q, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 1;
        areset = 0;
        ena = 0;
        load = 1;
        data = 4'hf;
    end

    initial begin
        #10 load <= 0;
    end

    initial begin
        #100 areset <= 1;
        #15  areset <= 0;
    end
    

    initial begin
        #20 ena <= 1;
        #20 ena <= 0;
    end

    initial
        #500 $finish;


endmodule