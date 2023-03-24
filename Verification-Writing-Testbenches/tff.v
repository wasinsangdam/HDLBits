module tff_tb ();

    reg         clk;
    reg         reset;
    reg         t;
    wire        q;

    tff inst1 (clk, reset, t, q);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        t = 0;
    end

    initial begin
        #5
        reset = 1;

        #5 
        reset = 0;
    end

    initial begin
        #10
        t = 1;
    end
    
endmodule