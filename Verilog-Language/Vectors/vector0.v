module vector0 (
    input   wire [2 : 0] vec,
    output  wire [2 : 0] outv,
    output  wire o2,
    output  wire o1,
    output  wire o0
);

    assign outv = vec;
    assign o0 = vec[0];
    assign o1 = vec[1];
    assign o2 = vec[2];

endmodule

module test;

    reg     [2 : 0] vec;
    wire    [2 : 0] outv;
    wire            o0, o1, o2;

    vector0 inst1 (vec, outv, o2, o1, o0);

    initial begin 
        $display("vec\to0\to1\to2\toutv");
        $monitor("%3b\t%b\t%b\t%b\t%3b", vec, o0, o1, o2, outv, $time);
    end

    initial begin
        
        vec = 0;

        #10
        vec = 1;

        #10 
        vec = 2;

        #10
        vec = 3;

        #10
        vec = 4;

        #10 
        vec = 5;

        #10 
        vec = 6;

        #10
        vec = 7;

        #10
        $finish;
    end

endmodule