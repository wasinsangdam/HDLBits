module wireDeclare (    input in,
                        output out );

    wire not_in;

    assign not_in = ~in;
    assign out = ~not_in;

    initial begin
        $monitor("%b\t%b\t%b", in, not_in, out);
    end


endmodule

module test;

    reg     in;
    wire    out;

    wireDeclare inst1 ( in, out );

    initial begin
        $display("in\tout");
        $monitor("%b\t%b", in, out, $time);
    end

    initial begin
        in = 0;

        #10 
        in = 1;

        #10
        in = 0;

        #10
        in = 1;

        $finish;
    end

endmodule