module add32 (
    input   [31 : 0] a,
    input   [31 : 0] b,
    output  [31 : 0] sum
);
    
    wire    wcout1, wcout2;

    add16 inst1 ( .a(a[ 15 : 0 ]), .b(b[ 15 : 0 ]), .cin(1'b0),   .sum(sum[15 : 0 ]), .cout(wcout1) );
    add16 inst2 ( .a(a[ 31 : 16]), .b(b[ 31 : 16]), .cin(wcout1), .sum(sum[31 : 16]), .cout(wcout2) );

    // add16 inst1 ( a[15:0], b[15:0], 1'b0, sum[15:0], wcout1);
    // add16 inst2 ( a[31:16], b[31:16], wcout1, sum[31:16], wcout2);

endmodule


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

    reg     [31 : 0]    a, b;
    wire    [31 : 0]    sum;

    integer i;

    add32 inst1 (a, b, sum);

    initial begin
        $display("a\tb\tsum");
        $monitor("%08h\t%08h\t%08h", a, b, sum, $time);
    end

    initial begin 
        
        a = 0;
        b = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            a = $random;
            b = $random;
        end
        
        #10
        a = 32'hffff_ffff;
        b = 32'hffff_ffff;

        $finish;
    end

endmodule