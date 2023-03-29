module mux2to1v_tb;

    reg  [99 : 0] a;
    reg  [99 : 0] b;
    reg           sel;

    wire [99 : 0] out;

    integer i = 0;

    mux2to1v inst1 (a, b, sel, out);

    initial begin
        $dumpfile("mux2to1v.vcd");
        $dumpvars(0, mux2to1v_tb);
    end

    initial begin
        $display("a\tb\tsel\tout");
        $monitor("%8b\t%8b\t%8b\t%8b", a, b, sel, out, $time);
    end

    initial begin

        a = 0; b = 0; sel = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            a = $urandom % 128;
            b = $urandom % 128;
            sel = $urandom % 128;
        end

        $finish;
    end


endmodule