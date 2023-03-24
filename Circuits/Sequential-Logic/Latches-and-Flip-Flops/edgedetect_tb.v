module edgedetect_tb;

    reg          clk;
    reg  [7 : 0] in;

    wire [7 : 0] pedge;

    integer i;

    edgedetect inst1 (clk, in, pedge);

    initial begin
        $dumpfile("edgedetect.vcd");
        $dumpvars(0, edgedetect_tb);
    end

    initial begin
        $display("clk\tin\tpedge");
        $monitor("%b\t%b\t%b", clk, in, pedge, $time);
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