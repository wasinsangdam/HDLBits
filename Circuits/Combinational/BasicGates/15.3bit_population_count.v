module top_module (
    input       [2 : 0] in,
    output      [1 : 0] out
);

    integer i;

    always @ (*) begin
        out = 2'b0;
        for (i = 0; i < 3; i = i + 1) begin 
            out = out + in[i];
        end
    end

    // assign out = in[0]+in[1]+in[2];
    
endmodule