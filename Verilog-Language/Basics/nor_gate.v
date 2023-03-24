module top_module ( input a, b,
                    output out );

    assign out = ~( a | b );

endmodule

module test ();

    reg a, b;
    wire out;

    top_module nor_gate(a, b, out);

    initial begin
        $display("a\tb\tout");
        $monitor("%b\t%b\t%b", a, b, out, $time);
    end

    initial begin
        a = 0; b = 0;

        #10
        a = 0; b = 1;

        #10 
        a = 1; b = 0;

        #10
        a = 1; b = 1;

        #10
        $finish;
    end

endmodule