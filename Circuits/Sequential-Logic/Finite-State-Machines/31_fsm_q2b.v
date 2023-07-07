module fsm_q2b (
    input   [5 : 0] y,
    input           w,
    output          Y1,
    output          Y3
);


    assign Y1 = (y[0]) & w;                         // Detect edge transition from A to B
    assign Y3 = (y[1] | y[2] | y[4] | y[5]) & ~w;   // Detect edge transition from B, C, E, F to D 


endmodule