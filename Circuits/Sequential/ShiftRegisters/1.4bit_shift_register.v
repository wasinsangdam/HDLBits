module top_module (
    input                   clk     ,
    input                   areset  ,
    input                   load    ,
    input                   ena     ,
    input       [3 : 0]     data    ,
    output  reg [3 : 0]     q
);

    always @ (posedge clk, posedge areset) begin
        if (areset)
            q <= 4'h0;
        else begin
            if (load)  
                q <= data;
            else if (ena)
                q <= { 1'b0, q[3 : 1] };
        end
    end

endmodule