module vector4 (
    input   [ 7 : 0] in,
    output  [31 : 0] out
);

    assign out = { {24{in[7]}} , in};

endmodule


module test;

    reg     [ 7 : 0] in;
    wire    [31 : 0] out;
    
    integer i;

    vector4 inst1 (in, out);

    initial begin
        $display("in\t\tout");
        $monitor("%b\t%b", in, out);
    end

    initial begin
        in = 0;

        for (i = 0; i < 32; i = i + 1) begin
            #10
            in = (in + 65) % 255;
        end

        $finish;
    end
        

endmodule