module mux2to1v (
    input   [99 : 0] a, b,
    input            sel,
    output  [99 : 0] out
);
    reg     [99 : 0] out;
    
    always @(*) begin
        case(sel)
            0 : out = a;
            1 : out = b;
            default : out = 0;
        endcase
    end 

endmodule