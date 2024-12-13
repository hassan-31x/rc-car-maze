`timescale 1ns / 1ps

module ir_sensor(
    input ir_pin,output reg IR_OUT);
    always @*begin
    if (ir_pin)begin
    IR_OUT<=1'b1;
    end
    else begin 
    IR_OUT<=1'b0;
    end
    end
    
endmodule