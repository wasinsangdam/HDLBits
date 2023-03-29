`timescale 1ps/1ps

module rotate100_tb;

    reg           clk;
    reg           load;
    reg  [1  : 0] ena;
    reg  [99 : 0] data;

    wire [99 : 0] q;

    rotate100 inst1 (clk, load, ena, data, q);

    initial begin
        $dumpfile("rotate100.vcd");
        $dumpvars(0, rotate100_tb);
    end

    initial begin
        $display("clk\tload\tena\tdata\tq");
        $monitor("%b\t%b\t%b\t%b\t%b", clk, load, ena, data, q, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        load = 0;
        ena = 0;
        data = 99'hfff;
    end

    initial begin
        #10 load = 1;
        #10 load = 0;
    end

    initial begin
        #20     ena = 1;
        #100    ena = 2;
        #100    ena = 3;
        #100    ena = 0;
        #100    ena = 1;
        #100    ena = 2;
        #100    $finish;
    end



endmodule