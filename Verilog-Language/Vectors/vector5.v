module vector5 (input a,
                b,
                c,
                d,
                e,
                output [24 : 0] out);
    
    assign out = ~{{ {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} }} ^ {{5{a, b, c, d, e}}};
    
endmodule
    
    module test;
        
        reg             a, b, c, d, e;
        wire [24 : 0]   out;
        
        vector5 inst1 (a, b, c, d, e, out);
        
        integer i;
        initial begin
            $display("a\tb\tc\td\te\tout");
            $monitor("%b\t%b\t%b\t%b\t%b\t%b", a, b, c, d, e, out, $time);
        end
        
        initial begin
            
            a = 0;
            b = 0;
            c = 0;
            d = 0;
            e = 0;
            
            for (i = 0; i < 16; i = i + 1) begin
                #10
                a = $urandom % 2;
                b = $urandom % 2;
                c = $urandom % 2;
                d = $urandom % 2;
                e = $urandom % 2;
            end
            
            $finish;
        end
        
    endmodule
        
        
