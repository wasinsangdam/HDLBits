module add4 (
    input   [3 : 0] x,
    input   [3 : 0] y,
    output  [4 : 0] sum
);  

    wire    [3 : 0] cwire;

    fa inst1 (x[0], y[0], 1'b0,     cwire[0], sum[0]);
    fa inst2 (x[1], y[1], cwire[0], cwire[1], sum[1]);
    fa inst3 (x[2], y[2], cwire[1], cwire[2], sum[2]);
    fa inst4 (x[3], y[3], cwire[2], cwire[3], sum[3]);

    assign sum[4] = cwire[3];


endmodule

module fa (
    input   x,
    input   y,
    input   cin,
    output  cout,
    output  sum
);  

    assign {cout, sum} = x + y + cin;

endmodule