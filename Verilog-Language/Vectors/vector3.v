module vector3 ( 
    input   [4 : 0] a, b, c, d, e, f,
    output  [7 : 0] w, x, y, z
);

    assign {w, x, y, z} = {a, b, c, d, e, f, 2'b11};

endmodule

module test;

    reg     [4 : 0]     a, b, c, d, e, f;
    wire    [7 : 0]     w, x, y, z;

    integer i;

    vector3 inst1 (a, b, c, d, e, f, w, x, y, z);

    initial begin 
        $display("a\tb\tc\t\d\te\tf\t\tw\t\tx\t\ty\t\tz");
        $monitor("%b\t%b\t%b\t%b\t%b\t%b\t\t%b\t%b\t%b\t%b\t", a, b, c, d, e, f, w, x, y, z, $time);
    end

    initial begin   
        
        a = 0;
        b = 0; 
        c = 0; 
        d = 0; 
        e = 0; 
        f = 0;

        for (i = 0; i < 16; i += 1) begin
            # 10
            a = (a + 1) % 31;
            b = (b + 2) % 31;
            c = (c + 3) % 31;
            d = (d + 4) % 31;
            e = (e + 5) % 31;
            f = (f + 6) % 31;
        end
    end

endmodule