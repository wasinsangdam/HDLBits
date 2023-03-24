module top_module ( input a, b,
                    output out );

    assign out = a & b;

endmodule

module test;

    reg a1, b1;
    wire out;

    top_module and_gate(a1, b1, out);

    initial begin
        $display("a\tb\tout");
        $monitor("%b\t%b\t%b", a1, b1, out, $time);
    end

    initial begin

        a1 = 0; b1 = 0;

        #10 
        a1 = 1; b1 = 0;

        #10 
        a1 = 0; b1 = 1;

        #10 
        a1 = 1; b1 = 1;

        #10
        $finish;
    end

endmodule
