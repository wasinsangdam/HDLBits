module mpx2to1_tb;

    reg  a;
    reg  b;
    reg  sel;

    wire out;

    integer i;

    mpx2to1 inst1 (a, b, sel, out);

    initial begin
        $dumpfile("mpx2to1.vcd");
        $dumpvars(0, mpx2to1_tb);
    end

    initial begin
        $display("a\tb\tsel\tout");
        $monitor("%b\t%b\t%b\t%b", a, b, sel, out, $time);
    end

    initial begin
        a = 0; b = 0; sel = 0;
        
        for (i = 0; i < 16; i = i + 1) begin
            #10
            a = $random;
            b = $random;
            sel = $random;
        end

    end


endmodule