module top_module (
    input   [31 : 0] a,
    input   [31 : 0] b,
    output  [31 : 0] sum
);

    wire    [15 : 0] wsum0;
    wire    [15 : 0] wsum1;
    wire             wcout;

    wire             cout1;
    wire             cout2;

    add16 inst1 ( .a(a[15 : 0 ]), .b(b[15 : 0 ]), .cin(1'b0), .sum(sum[15 : 0]), .cout (wcout));
    add16 inst2 ( .a(a[31 : 16]), .b(b[31 : 16]), .cin(1'b0), .sum(wsum0), .cout(cout1));
    add16 inst3 ( .a(a[31 : 16]), .b(b[31 : 16]), .cin(1'b1), .sum(wsum1), .cout(cout2));

    always @(wsum0 or wsum1 or wcout) begin
        
        case (wcout)
            0 : sum[31 : 16] = wsum0;
            1 : sum[31 : 16] = wsum1;
        endcase
    end


endmodule