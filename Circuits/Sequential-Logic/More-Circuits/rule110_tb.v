`timescale 1ps/1ps

module rule110_tb;

    reg             clk;
    reg             load;
    reg  [511 : 0]  data;

    wire [511 : 0]  q;

    rule110 inst1 (clk, load, data, q);

    initial begin
        $dumpfile("rule110.vcd");
        $dumpvars(0, rule110_tb);
    end

    initial begin
        $display("clk\tload\tdata\tq");
        $monitor("%b\t%b\t%b\t%b", clk, load, data, q, $time);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        
        #5 
        load = 1; data = 1;
        
        #5
        load = 0;
    end
    initial begin
        #300  
        $finish;
    end



endmodule