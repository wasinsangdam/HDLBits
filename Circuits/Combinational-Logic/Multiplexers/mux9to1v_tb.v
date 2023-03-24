module mux9to1v_tb;

    reg  [15 : 0] a;
    reg  [15 : 0] b;
    reg  [15 : 0] c;
    reg  [15 : 0] d;
    reg  [15 : 0] e;
    reg  [15 : 0] f;
    reg  [15 : 0] g;
    reg  [15 : 0] h;
    reg  [15 : 0] i;
    reg  [ 3 : 0] sel;

    wire [15 : 0] out;

    integer k;

    mux9to1v inst1 (a, b, c, d, e, f, g, h, i, sel, out);

    initial begin
        $dumpfile("mux9to1v.vcd");
        $dumpvars(0, mux9to1v_tb);
    end

    initial begin
        $display("a\tb\tc\td\te\tf\tg\th\ti\tsel\tout");
        $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", a, b, c, d, e, f, g, h, i, sel, out, $time);
    end

    initial begin

        a = $urandom; b = $urandom; c = $urandom; d = $urandom;
        e = $urandom; f = $urandom; g = $urandom; h = $urandom; i = $urandom;
        sel = 0;

        for (k = 0; k < 16; k = k + 1) begin
            #10
            sel = $urandom;
        end

        $finish;

    end


endmodule