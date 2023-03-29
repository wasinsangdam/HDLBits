module add4_tb;

    reg  [3 : 0] x;
    reg  [3 : 0] y;

    wire [4 : 0] sum;
    
    integer i;

    add4 inst1 (x, y, sum);

    initial begin
        $dumpfile("add4.vcd");
        $dumpvars(0, add4_tb);
    end

    initial begin
        $display("x\ty\tsum");
        $monitor("%b\t%b\t%b", x, y, sum, $time);
    end

    initial begin
        x = 0; y = 0;

        for (i = 0; i < 16; i = i +1 ) begin
            #10
            x = $urandom;
            y = $urandom;
        end

        $finish;
    end

endmodule