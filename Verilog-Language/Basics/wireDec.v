module wireDec (    input a, b, c, d, 
                    output out, out_n );

    wire ab, cd;

    assign ab = a & b;
    assign cd = c & d;

    assign out = ab | cd;
    assign out_n = ~( ab | cd );

endmodule


module test;

    reg     a, b, c, d;
    wire    out, out_n;

    wireDec inst1 (a, b, c, d, out, out_n);

    initial begin
        $display("a\tb\tc\td\t\tout\tout_n");
        $monitor("%b\t%b\t%b\t%b\t\t%b\t%b", a, b, c, d, out, out_n);
    end

    initial begin
        
        a = 0; b = 0; c = 0; d = 0;

        #10
        a = 0; b = 0; c = 0; d = 1;

        #10
        a = 0; b = 0; c = 1; d = 0;

        #10
        a = 0; b = 1; c = 0; d = 0;

        #10
        a = 1; b = 0; c = 0; d = 0;

        #10
        a = 1; b = 1; c = 0; d = 0;

        #10
        a = 1; b = 1; c = 1; d = 1;

        #10
        a = 1; b = 1; c = 1; d = 0;

        #10
        $finish;
    end

endmodule
