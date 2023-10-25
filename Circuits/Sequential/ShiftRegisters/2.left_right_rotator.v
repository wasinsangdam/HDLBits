module top_module (
    input                   clk     ,
    input                   load    ,
    input       [ 1 : 0]    ena     ,
    input       [99 : 0]    data    ,
    output  reg [99 : 0]    q
);

    always @ (posedge clk) begin
        if (load)
            q <= data;
        else begin
            case (ena)
                2'b00 : q <= q;
                2'b01 : q <= {q[0], q[99 : 1]};
                2'b10 : q <= {q[98 : 0], q[99]};
                2'b11 : q <= q;
            endcase
        end
    end

    // always @(posedge clk) begin
	// 	if (load)		// Load
	// 		q <= data;
	// 	else if (ena == 2'b01)	// Rotate right
	// 		q <= {q[0], q[99:1]};
	// 	else if (ena == 2'b10)	// Rotate left
	// 		q <= {q[98:0], q[99]};
	// end

endmodule