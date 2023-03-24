module vector2 (input [31 : 0] in,
                output [31 : 0] out);
    
    wire    [7 : 0] w1, w2, w3, w4;
    
    assign {w1, w2, w3, w4} = in;
    assign out              = {w4, w3, w2, w1};
    
    
endmodule
