module count1to12 (
    input           clk,
    input           reset,
    input           enable,
    output  [3 : 0] Q,
    output          c_enable,
    output          c_load,
    output  [3 : 0] c_d
);

    always @(posedge clk) begin
        if (reset | ((Q == 12) & enable))
            Q <= 1;
        else begin
            if (enable)
                Q <= Q + 1;
            else
                Q <= Q;
        end
    end

    assign c_enable = enable;
    assign c_load   = reset | (enable & (Q == 12));
    assign c_d      = c_load ? 1 : 0;
    count4 the_counter (clk, c_enable, c_load, c_d);



endmodule


// the 4-bit binary counter, which has Enable and 
// synchronous parallel-load inputs (load has higer priority than enable).

module count4 (
    input           clk,
    input           enable,
    input           load,
    input   [3 : 0] d,
    output  [3 : 0] Q
);

    reg     [3 : 0] Q;



endmodule