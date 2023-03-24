module shift8 (input clk,
               input [7 : 0] d,
               input [1 : 0] sel,
               output reg [7 : 0] q);
    
    wire    [7 : 0]     q1;
    wire    [7 : 0]     q2;
    wire    [7 : 0]     q3;
    
    my_dff8 inst1 (.clk(clk), .d(d),  .q(q1));
    my_dff8 inst2 (.clk(clk), .d(q1), .q(q2));
    my_dff8 inst3 (.clk(clk), .d(q2), .q(q3));
    
    always @ (*) begin
        
        case (sel)
            0 : q = d;
            1 : q = q1;
            2 : q = q2;
            3 : q = q3;
        endcase
    end
    
endmodule
    
module my_dff8 (
    input                   clk,
    input       [7 : 0]     d,
    output reg  [7 : 0]     q
    );
        
    always@(posedge clk) begin
        q <= d;
    end
        
endmodule
        
module test;

    reg                 clk;
    reg     [7 : 0]     d;
    reg     [1 : 0]     sel;
    wire    [7 : 0]     q;

    integer i;

    shift8 test ( .clk(clk), .d(d), .sel(sel), .q(q) );

    // initial begin
    //     $display("d\t\tsel\tq");
    //     $monitor("%b\t%b\t%b", d, sel, q, $time);
    // end

    initial begin 
        $display("d\t\tsel\tq");
        $monitor("%d\t%d\t%d", d, sel, q);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        d = 0;
        sel = 0;

        for (i = 0; i < 16; i = i + 1) begin
            #10 
            d = $urandom % 255;

            if (i % 4 == 0 && i != 0)
                sel = sel + 1;
        end


        $finish;

    end


endmodule

