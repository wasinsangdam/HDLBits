module ev2 (
    input   [1 : 0] A,
    input   [1 : 0] B,
    output          z
);
    reg z;

    always @(*) begin
        if (A == B) 
            z = 1;
        else
            z = 0;
    end

endmodule

module test;

    reg     [1 : 0] A, B;
    wire               z;

    integer i;

    ev2 inst1 (A, B, z);
    
    initial begin
        $display("A\tB\tz");
        $monitor("%b\t%b\t%b", A, B, z, $time);
    end
    
    initial begin
        A = 0; B = 0;

        for (i = 0; i < 32; i = i + 1) begin
            #10
            A = $urandom;
            B = $urandom;
        end

        $finish;

    end

endmodule