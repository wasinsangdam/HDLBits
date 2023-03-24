module mux256to1_tb;

    reg  [255 : 0] in;
    reg  [  7 : 0] sel;

    wire           out;
    
    integer i;

    mux256to1 inst1 (in, sel, out);

    initial begin
        $dumpfile("mux256to1.vcd");
        $dumpvars(0, mux256to1_tb);
    end

    initial begin
        $display("in\tsel\tout");
        $monitor("%b\t%b\t%b", in, sel, out, $time);
    end

    initial begin
        in = $random; sel = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10 
            sel = $random;
        end

        $finish;
    end        

endmodule