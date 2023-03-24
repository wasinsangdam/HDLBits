module bcdadd100 (
    input   [399 : 0] a, b,
    input             cin,
    output            cout,
    output  [399 : 0] sum
);

    wire    [99 : 0] cout_wires;
    genvar i;

    bcd_fadd fadd0 (a[3 : 0], b[3: 0], cin, cout_wires[0], sum[3 : 0]);

    generate
        for (i = 1; i < 100; i = i + 1) begin : fadd_400
            bcd_fadd fadd ( a[(i * 4) + 3 : i * 4], 
                            b[(i * 4) + 3 : i * 4],
                            cout_wires[i - 1],
                            cout_wires[i], 
                            sum[(i * 4) + 3 : i * 4]);
        end

    endgenerate

    assign cout = cout_wires[99];



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


module test;

    reg     [399 : 0]   a, b;
    reg                 cin;
    wire                cout;
    wire    [399 : 0]   sum;

    integer i;

    bcdadd100 test0(a, b, cin, cout, sum);

    wire    [400 : 0]  result;

    assign result = {cout, sum};

    initial begin
        $display("a\tb\tcin\tresult");
        $monitor("%4d\t%4d\t%4d\t%4d", a, b, cin, result, $time);
    end  

    initial begin
        a = 0; b = 0; cin = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            a = $urandom % 100;
            b = $urandom % 100;
            cin = $urandom % 2;
        end

        $finish;
    end

endmodule