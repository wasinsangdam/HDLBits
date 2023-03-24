module edgecapture_tb;

    reg          clk;
    reg          reset;
    reg  [31 : 0] in;

    wire [31 : 0] out;

    integer i;

    edgecapture inst1 (clk, reset, in, out);

    initial begin
        $dumpfile("edgecapture.vcd");
        $dumpvars(0, edgecapture_tb);
    end

    initial begin
        $display("clk\treset\tin\tout");
        $monitor("%b\t%b\t%b\t%b", clk, reset, in, out, $time);
    end

    always #5 clk = ~clk;

    initial begin
        #10 reset = 1;
        #30 reset = 0;
        #50 reset = 1;
        #60 reset = 0;
        #30 reset = 1;
        #10 reset = 0;
    end
    
    initial begin
        clk = 0;
        reset = 0;
        in = 0;

        for (i = 0; i < 32; i = i + 1) begin
            #10
            in = $urandom;
        end

        $finish;
    end


endmodule