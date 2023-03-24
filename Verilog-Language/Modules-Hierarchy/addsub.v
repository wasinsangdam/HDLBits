module addsub (
    input   [31 : 0] a,
    input   [31 : 0] b,
    input            sub,
    output  [31 : 0] sum
);

    wire    [31 : 0] bsub;
    wire             outin;

    assign bsub = { 32{sub} } ^ b;

    add16 inst1 ( .a(a[15 :  0]), .b(bsub[15 :  0]), .cin(sub), .sum(sum[15 :  0]), .cout(outin) );
    add16 inst2 ( .a(a[31 : 16]), .b(bsub[31 : 16]), .cin(outin), .sum(sum[31 : 16]));


endmodule