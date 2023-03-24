module popcount255 (
    input       [254 : 0]   in,
    output  reg [ 7  : 0]   out
);

    integer i;

    always @(*) begin
        
        out = 0;

        for (i = 0; i < $bits(in); i = i + 1) begin
            if (in[i])
                out = out + 1;
            else
               out = out;
        end
    end

endmodule

module test;

    reg     [254 : 0] in;
    wire    [ 7  : 0] out;

    integer i;

    popcount255 inst1 (in, out);

    initial begin
        $display("in\tout");
        $monitor("%h\t%d", in, out, $time);
    end    

    initial begin
        in = 0;

        for (i = 0; i < 16; i++) begin
            #10
            in = $random;
        end

        $finish;
    end

endmodule