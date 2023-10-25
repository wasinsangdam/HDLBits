module top_module (
    input           [3 : 0] SW  ,
    input           [3 : 0] KEY ,
    output          [3 : 0] LEDR
);

    // KEY[0] : clk, KEY[1] : E, KEY[2] : L, KEY[3] : w
    // SW : R
    // Q : LEDR

    sub_module inst0 (
        .clk    (KEY[0] ),
        .w      (KEY[3] ),
        .R      (SW[3]  ),
        .E      (KEY[1] ),
        .L      (KEY[2] ),
        .Q      (LEDR[3])
    );

    sub_module inst1 (
        .clk    (KEY[0] ),
        .w      (LEDR[3]),
        .R      (SW[2]  ),
        .E      (KEY[1] ),
        .L      (KEY[2] ),
        .Q      (LEDR[2])
    );

    sub_module inst2 (
        .clk    (KEY[0] ),
        .w      (LEDR[2]),
        .R      (SW[1]  ),
        .E      (KEY[1] ),
        .L      (KEY[2] ),
        .Q      (LEDR[1])
    );

    sub_module inst3 (
        .clk    (KEY[0] ),
        .w      (LEDR[1]),
        .R      (SW[0]  ),
        .E      (KEY[1] ),
        .L      (KEY[2] ),
        .Q      (LEDR[0])
    );

endmodule

module sub_module (
    input               clk ,
    input               w   ,
    input               R   ,
    input               E   ,
    input               L   ,
    output              Q
);

    always @ (posedge clk) begin
        if (E) begin
            if (L)  Q <= R;
            else    Q <= w;
        end
        else begin
            if (L)  Q <= R;
            else    Q <= Q;
        end
    end
        

endmodule