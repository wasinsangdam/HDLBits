`timescale 1ps/1ps

module vectorgates (
    input   [2 : 0] a,
    input   [2 : 0] b,
    output  [2 : 0] out_or_bitwise,
    output          out_or_logical,
    output  [5 : 0] out_not
);

    assign out_or_bitwise = a | b;
    assign out_or_logical = a || b;
    assign out_not = ~{b, a};

endmodule

module vectorgates_tb;

    reg     [2 : 0] a, b;
    wire    [2 : 0] out_or_bitwise;
    wire            out_or_logical;
    wire    [5 : 0] out_not;

    vectorgates inst1 (a, b, out_or_bitwise, out_or_logical, out_not);

    initial begin
        $dumpfile("vectorgates.vcd");
        $dumpvars(0, vectorgates_tb);
    end
    
    initial begin
        $display("a\tb\tor_bit\tor_logic\tnot");
        $monitor("%b\t%b\t%b\t%b\t\t%b", a, b, out_or_bitwise, out_or_logical, out_not, $time);
    end

    


    initial begin
        a = 0; b = 0;

        #10
        a = 1; b = 0;

        #10 
        a = 4; b = 3;

        #10 
        a = 5; b = 2;

        #10
        a = 7; b = 1;

        #10
        a = 0; b = 7;

        #10
        $finish;
    end

endmodule