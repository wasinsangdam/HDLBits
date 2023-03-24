module dff_gate_tb;

    reg          clk;
    reg          in;

    wire         out;

    integer i;

    dff_gate inst1 (clk, in, out);

    initial begin
        $dumpfile("dff_gate.vcd");
        $dumpvars(0, dff_gate_tb);
    end

    initial begin
        $display("clk\tin\tout");
        $monitor("%b\t%b\t%b", clk, in, out, $time);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        in = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            in = $random;
        end

        $finish;
        
    end

            
            
endmodule