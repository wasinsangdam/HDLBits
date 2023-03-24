module add16 (
    input   [15 : 0]    a,
    input   [15 : 0]    b,
    input               cin,
    output  [15 : 0]    sum,
    output              cout
);

    assign {cout, sum} = a + b + cin;

endmodule

module test;

    reg     [15 : 0]    a;
    reg     [15 : 0]    b;
    reg                 cin;
    wire    [15 : 0]    sum;
    wire                cout;

    integer i;

    add16 inst1 (a, b, cin, sum, cout);

    initial begin
        $display("a\tb\tcin\tsum\tcout");
        $monitor("%d\t%d\t%d\t%d\t%d", a, b, cin, sum, cout, $time);
    end    

    initial begin
        
        a = 0; b = 0; cin = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            a = $random; b = $random; cin = 0;
        end

        $finish;
    end

endmodule