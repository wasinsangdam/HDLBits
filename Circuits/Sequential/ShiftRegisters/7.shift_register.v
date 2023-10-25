module top_module (
    input                   clk     ,
    input                   resetn  ,
    input                   in      ,
    output                  out
);  

    reg                     temp1, temp2, temp3, temp4;

    always @(posedge clk) begin
        if (!resetn) begin
            {temp1, temp2, temp3, temp4} <= 4'h0;
        end
        else begin
            temp4 <= temp3;
            temp3 <= temp2;
            temp2 <= temp1;
            temp1 <= in;
        end
    end

    assign out = temp4;

endmodule