module lfsr32 (
    input               clk,
    input               reset,
    output  [31 : 0]    q
);
    reg     [31 : 0]    temp;

    always @ (*) begin
        temp = q[31 : 1];
        temp[31] = q[0];
        temp[21] = q[22] ^ q[0];
        temp[1]  = q[2]  ^ q[0];
        temp[0]  = q[1]  ^ q[0]; 
    end


    always @ (posedge clk) begin
        if (reset)
            q <= 32'h1;
        else
            q <= temp;
    end
    

endmodule