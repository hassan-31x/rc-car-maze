`timescale 1ns / 1ps


module car_collided(
    input wire IR_OUT,
    output reg car_collided
    );
//    wire ir_pin;
//    ir_sensors detection(.ir_pin(ir_pin),.IR_OUT(IR_OUT));
    always@*begin
    if (IR_OUT) begin 
    car_collided<=1'b0;
    end
    else begin
    car_collided<= 1'b1;
    end 
    end 
endmodule

