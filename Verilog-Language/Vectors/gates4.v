module gates4 (input [3 : 0] in,
               output out_and,
               output out_or,
               output out_xor);
    
    // assign out_and = in[0] & in[1] & in[2] & in[3];
    // assign out_or  = in[0] | in[1] | in[2] | in[3];
    // assign out_xor = in[0] ^ in[1] ^ in[2] ^ in[3];

    assign out_and = &in;
    assign out_or  = |in;
    assign out_xor = ^in;
    
endmodule
    
    module test();
        
        reg [3 : 0] in;
        wire        out_and, out_or, out_xor;
        
        integer i;
        
        gates4 inst1 (in, out_and, out_or, out_xor);
        
        initial begin
            $display("in\tand\tor\txor");
            $monitor("%b\t%b\t%b\t%b", in, out_and, out_or, out_xor, $time);
        end
        
        initial begin
            
            in = 0;
            
            for (i = 0; i < 15; i = i + 1) begin
                #10
                in = in + 1;
            end
            
            $finish;
        end
        
        
    endmodule