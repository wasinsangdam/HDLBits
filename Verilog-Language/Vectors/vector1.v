module vector1 (
    input   [ 15 : 0]   in,
    output  [ 7  : 0]   out_hi,
    output  [ 7  : 0]   out_lo
);

    assign out_hi = in[ 15 : 8 ];
    assign out_lo = in[ 7  : 0 ];

endmodule


module test;

    reg     [ 15 : 0 ] in;
    wire    [ 7  : 0 ] out_hi;
    wire    [ 7  : 0 ] out_lo;

    integer i;

    vector1 inst1 (in, out_hi, out_lo);

    initial begin
        $display("in\tout_hi\tout_lo");
        $monitor("%h\t%h\t%h", in, out_hi, out_lo);
    end

    initial begin
        
        in = 0;

        for (i = 0; i < 16'hffff; i = i + 8) begin
            #10 
            in <= in + 1;
        end

        $finish;

    end

endmodule