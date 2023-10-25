module top_module (
    input   wire            too_cold    ,
    input   wire            too_hot     ,
    input   wire            mode        ,
    input   wire            fan_on      ,
    output  wire            heater      ,
    output  wire            aircon      ,
    output  wire            fan         
);

    assign heater = mode & too_cold & ~aircon;
    assign aircon = ~mode & too_hot & ~heater;
    assign fan = fan_on | (heater ^ aircon);

endmodule