module mpx2to1(
    input   a, 
    input   b, 
    input   sel,
    output  out
);
    
    reg     out;

    always @(*) begin
        
        case (sel)
            0 : out = a;
            1 : out = b;

            default : out = 0;
        endcase
    end

endmodule

