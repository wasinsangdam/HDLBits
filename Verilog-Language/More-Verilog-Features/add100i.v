module add100i (
    input   [99 : 0]    a, b,
    input               cin,
    output  [99 : 0]    cout,
    output  [99 : 0]    sum
);

    genvar i;

    add1i full_adder_0 (a[0], b[0], cin, cout[0], sum[0]);

    generate
        for (i = 1; i < 100; i = i + 1) begin : add_block
            add1i full_adder (a[i], b[i], cout[i - 1], cout[i], sum[i]);
        end       
    endgenerate

endmodule

module add1i (
    input       a, b,
    input       cin,
    output      cout,
    output      sum  
);

    assign {cout, sum} = a + b + cin;

endmodule

module test;

    reg     [99 : 0] a, b;
    reg              cin;
    wire    [99 : 0] cout;
    wire    [99 : 0] sum;

    integer i;

    add100i inst1 (a, b, cin, cout, sum);

    wire    [100 : 0] result;

    assign result = {cout[99], sum};

    initial begin
        $display("a\tb\tcin\tcout\tsum");
        $monitor("%d\t%d\t%d\t%d\t", a, b, cin, result, $time);
    end

    initial begin
         a = 0; b = 0; cin = 0;

         for (i = 0; i < 16; i++) begin
            #10
            a = $urandom % 100;
            b = $urandom % 100;
            cin = $random % 2;
         end

         $finish;
    end

endmodule