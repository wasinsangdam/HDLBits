module bcdadd4 (
    input   [15 : 0]    a, b,
    input               cin,
    output              cout,
    output  [15 : 0]    sum
);

    wire    [3 : 0] cwire;

    bcd_fadd inst1 (a[3  :  0], b[3  :  0], cin,      cwire[0], sum[3  :  0]);
    bcd_fadd inst2 (a[7  :  4], b[7  :  4], cwire[0], cwire[1], sum[7  :  4]);
    bcd_fadd inst3 (a[11 :  8], b[11 :  8], cwire[1], cwire[2], sum[11 :  8]);
    bcd_fadd inst4 (a[15 : 12], b[15 : 12], cwire[2], cwire[3], sum[15 : 12]);

    assign cout = cwire[3];
    

endmodule

module bcd_fadd (
    input   [3 : 0] a,
    input   [3 : 0] b,
    input           cin,
    output          cout,
    output  [3 : 0] sum
);

    assign {cout, sum} = a + b + cin;

endmodule