module top_module (
    input                   clk     ,
    input                   reset   ,
    input                   s       ,
    input                   w       ,
    output                  z
);

    parameter   A   = 0,
                B   = 1,
                C   = 2,
                D   = 3;

    reg         [1 : 0]     curr_state, next_state;

    always @ (posedge clk) begin
        if (reset)  curr_state <= A;
        else        curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            A       : next_state = s ? B : A;
            B       : next_state = C;
            C       : next_state = D;
            D       : next_state = B;
            default : next_state = A;
        endcase
    end

    reg         [2 : 0]     temp;

    always @ (posedge clk) begin
        if      (reset)              temp <= 3'h0;
        else if (!(curr_state == A)) temp <= {temp[1 : 0], w};
    end

    assign z =  (curr_state == B) & (   (temp == 3'b110) |
                                        (temp == 3'b101) |
                                        (temp == 3'b011)    ) ;



endmodule