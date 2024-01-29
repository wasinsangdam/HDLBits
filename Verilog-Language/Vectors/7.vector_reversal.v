module top_module (
    input       [7 : 0] in,
    output      [7 : 0] out
);

    assign out = { in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7] };

    // integer i;

    // always @(*) begin
    //     for(i = 0; i < 8; i = i + 1) 
    //         out[i] = in[8 - i - 1]; 
    // end

    // genvar i;
    
    // generate
    //     for (i = 0; i < 8; i = i + 1) begin : gen
    //         assign out[i] = in[8 - i - 1]; 
    //     end
    // endgenerate
    
endmodule