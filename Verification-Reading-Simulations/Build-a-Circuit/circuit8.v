module circuit8 (
    input       clock,
    input       a,
    output      p,
    output      q
);

    always @ (*) begin
        if (clock)  p = a;
        else        q = p;
    end

    

endmodule