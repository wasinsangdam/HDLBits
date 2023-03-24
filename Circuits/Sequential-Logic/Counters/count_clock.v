module count_clock (
    input           clk,
    input           reset,
    input           ena,
    output          pm,
    output  [7 : 0] hh,
    output  [7 : 0] mm,
    output  [7 : 0] ss
);
    reg     [7 : 0] ss, mm, hh;
    reg             pm;

    always @ (posedge clk) begin
        if (reset)
            ss <= 0;
        else if (ena) begin
            if (ss == 8'h59)
                ss <= 8'h00;
            else begin
                if (ss[3 : 0] < 4'h9)
                    ss[3 : 0] <= ss[3 : 0] + 1;
                else begin
                    ss[3 : 0] <= 4'h0;
                    ss[7 : 4] <= ss[7 : 4] + 1;
                end
            end
        end
    end

    always @ (posedge clk) begin
        if (reset)
            mm <= 0;
        else if (ena && ss == 8'h59) begin
            if (mm == 8'h59)
                mm <= 8'h00;
            else begin
                if (mm[3 : 0] < 4'h9)
                    mm[3 : 0] <= mm[3 : 0] + 1;
                else begin
                    mm[3 : 0] <= 4'h0;
                    mm[7 : 4] <= mm[7 : 4] + 1;
                end
            end
        end
    end

    always @ (posedge clk) begin
        if (reset)
            hh <= 8'h12;
        else if (ena) begin
            if (mm == 8'h59 && ss == 8'h59) begin
                if (hh == 8'h12)
                    hh <= 8'h01;
                else begin
                    if (hh[3 : 0] < 4'h9)
                        hh[3 : 0] <= hh[3 : 0] + 1;
                    else begin
                        hh[3 : 0] = 4'h0;
                        hh[7 : 4] <= hh[7 : 4] + 1;
                    end
                end
            end
        end
    end

    always @ (posedge clk) begin
        if (reset) pm <= 0;
        else if (hh == 8'h11 && mm == 8'h59 && ss == 8'h59)
            pm = !pm;
    end

            


endmodule

module count_ten (
    input           clk,
    input           reset,
    input           ena,
    output [3 : 0]  s
);
    reg     [3 : 0] s;

    always @ (posedge clk) begin
        if (reset | (ena & s == 9))
            s <= 0;
        else begin
            if (ena)
                s <= s + 1;
            else
                s <= s;
        end
    end

endmodule

module count_five (
    input           clk, 
    input           reset,
    input           ena, 
    output [3 : 0]  s
);
    reg     [3 : 0] s;

    always @ (posedge clk) begin
        if (reset | (ena & s == 5))
            s <= 0;
        else begin
            if (ena)
                s <= s + 1;
            else
                s <= s;
        end
    end

endmodule