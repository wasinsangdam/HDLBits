module adder3_tb;

    reg  [2 : 0] a;
    reg  [2 : 0] b;
    reg          cin;

    wire [2 : 0] cout;
    wire [2 : 0] sum;

    wire [3 : 0] result;

    assign result = {cout[2], sum};

    integer i;

    adder3 inst1 (a, b, cin, cout, sum);

    initial begin
        $dumpfile("adder3.vcd");
        $dumpvars(0, adder3_tb);
    end

    initial begin
        $display("a\tb\tcin\tcout\tsum");
        $monitor("%d\t%d\t%d\t%d", a, b, cin, result, $time);
    end

    initial begin
        a = 0; b = 0; cin = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10
            a = $urandom;
            b = $urandom;
            cin = $urandom;
        end

        $finish;
    end

endmodule