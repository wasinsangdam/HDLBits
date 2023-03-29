module edgedetect2_tb;

    reg          clk;
    reg  [7 : 0] in;

    wire [7 : 0] anyedge;

    integer i;

    edgedetect2 inst1 (clk, in, anyedge);

    initial begin
        $dumpfile("edgedetect2.vcd");
        $dumpvars(0, edgedetect2_tb);
    end

    initial begin
        $display("clk\tin\tanyedge");
        $monitor("%b\t%b\t%b", clk, in, anyedge, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        in = 0;

        for (i = 0; i < 32; i = i + 1) begin
            #10
            in = $urandom;
        end

        $finish;
    end


endmodule