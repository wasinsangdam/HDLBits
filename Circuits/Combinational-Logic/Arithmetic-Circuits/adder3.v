module adder3 (
    input   [2 : 0] a, b,
    input           cin,
    output  [2 : 0] cout,
    output  [2 : 0] sum
);

    adder inst1 (a[0], b[0], cin, cout[0], sum[0]);
    adder inst2 (a[1], b[1], cout[0], cout[1], sum[1]);
    adder inst3 (a[2], b[2], cout[1], cout[2], sum[2]);


endmodule

module adder (
    input   a, b,
    input   cin,
    output  cout, 
    output  sum
);  

    assign {cout, sum} = a + b + cin;

endmodule