module always_if (
    input   a, 
    input   b,
    input   sel_b1,
    input   sel_b2,
    output  wire    out_assign,
    output  reg     out_always
);

    assign out_assign =( { sel_b1, sel_b2 } == 2'b11 ) ? b : a;

    always @ (*) begin
        if ( {sel_b1, sel_b2} == 2'b11 ) 
            out_always = b;
        else 
            out_always = a;
    end


endmodule