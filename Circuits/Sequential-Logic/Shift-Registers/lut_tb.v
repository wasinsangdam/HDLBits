`timescale 1ps/1ps

module lut_tb;

    reg          clk;
    reg          enable;
    reg          S;
    reg          A;
    reg          B;
    reg          C;

    wire         Z;

    lut inst1 (clk, enable, S, A, B, C, Z);

    initial begin
        $dumpfile("lut.vcd");
        $dumpvars(0, lut_tb);
    end

    initial begin
        $display("clk\tenable\tS\tA\tB\tC\tZ");
        $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b", clk, enable, S, A, B, C, Z, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        enable = 0;
        S = 0;
        A = 0;
        B = 0;
        C = 0;
    end
    
    initial begin
        #10 enable = 1;
        #100 enable = 0;
        #10 enable = 1;
    end

    initial begin
        #20 A = 1;
        #100 A = 0;
    end

    initial begin
        #50 B = 1;
        #100 B = 0;
    end

    initial begin
        #40 C = 1;
        #110 C = 0;
    end

    initial #500 $finish;

endmodule