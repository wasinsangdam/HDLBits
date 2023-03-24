module top_module ( input in,
                    output out );

    assign out = ~in;

endmodule

module test;

    reg in1;
    wire out1;

    top_module not_gate(in1, out1);

    initial begin
        $display("in\tout");
        $monitor("%b\t%b", in1, out1);
    end

    initial begin
        in1 = 0;

        #10
        in1 = 1;

        #10
        in1 = 0;

        #20
        in1 = 1;

        #30
        in1 = 0;

        #30
        in1 = 1;
        $finish;
    end

endmodule