module dff16e_tb;

    reg          clk;
    reg          resetn;
    reg  [1 : 0] byteena;
    reg  [15 : 0] d;

    wire [15 : 0] q;

    integer i;

    dff16e inst1 (clk, resetn, byteena, d, q);

    initial begin
        $dumpfile("dff16e.vcd");
        $dumpvars(0, dff16e_tb);
    end

    initial begin
        $display("clk\tresetn\tbyteena\td\tq");
        $monitor("%b\t%b\t%b\t%b\t%b", clk, resetn, byteena, d, q, $time);
    end

    initial clk <= 0 ;

    always #5 clk = ~clk;

    initial begin
        resetn <= 0;

        #10 resetn <= 1;
        #20 resetn <= 0;

        #50 resetn <= 1;
        #30 resetn <= 0;
        #10 resetn <= 1;
    end

    initial begin
        byteena <= 0;

        #80 byteena <= 1;
        #80 byteena <= 2;
        #80 byteena <= 3;
    end


    initial begin
        
        d <= 0;

        for (i = 0; i < 32; i = i + 1) begin
            #10
            d <= $random;
        end

        $finish;

    end


endmodule