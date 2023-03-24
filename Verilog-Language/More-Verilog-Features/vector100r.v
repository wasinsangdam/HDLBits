module vector100r (
    input   [99 : 0] in,
    output  reg [99 : 0] out
);

    integer i;

    always @(*) begin
        
        for (i = 0; i < 100; i = i + 1) begin
            out[i] = in[99 - i]; 
        end

    end

endmodule


module test;

    reg     [99 : 0] in;
    wire    [99 : 0] out;

    integer i;

    vector100r inst1 (in, out);

    initial begin
        $display("in\tout");
        $monitor("%b\t%b", in, out, $time);
    end

    initial begin
        in = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            in = $random;
        end
    end

endmodule