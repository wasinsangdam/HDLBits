module popcount3 (
    input   [2 : 0] in,
    output  [1 : 0] out
);
    reg     [1 : 0] out;

    integer i;

    always @(*) begin

        out = 0;

        for (i = 0; i < 3; i = i + 1) begin
            if (in[i] == 1'b1) out = out + 1;
            else out = out;
        end
        
    end

endmodule

module test;

    reg     [2 : 0] in;
    wire    [1 : 0] out;

    integer i;

    popcount3 inst1 (in, out);

    initial begin
        $display("in\tout");
        $monitor("%b\t%b", in, out, $time);
    end

    initial begin
        
        in = 0;

        for (i = 0; i < 32; i = i + 1) begin
            #10
            in = $random;
        end

        $finish;

    end

endmodule