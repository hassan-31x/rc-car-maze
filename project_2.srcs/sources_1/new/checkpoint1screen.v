`timescale 1ns / 1ps
module checkpoint1screen(
//inputs and outputs as usual,
input clk_d,
input [9:0] pixel_x,
input [9:0] pixel_y,
//input ir_pin2,
//input ir_pin3,
input video_on,

output reg [3:0] red = 0,
output reg [3:0] green = 0,
output reg [3:0] blue = 0
);
//    wire IR_OUT2;
//    wire IR_OUT3;
//    wire IR_OUT4;
//    wire check1;
//    wire check2;
reg [3:0] white = 0;

//ir_sensor irs2(
//        .ir_pin(ir_pin2),
//        .IR_OUT(IR_OUT2)
//    );
//    ir_sensor irs3(
//        .ir_pin(ir_pin3),
//        .IR_OUT(IR_OUT3)
//    );
//  car_collided checkpoint1(
//        .IR_OUT(IR_OUT3),
//        .car_collided(check1)
//    );
    
//    car_collided checkpoint2(
//        .IR_OUT(IR_OUT4),
//        .car_collided(check2)
//    );  
    
always @(posedge clk_d) begin

begin
red <= 4'hF;  //black
green <= 4'h0;
blue <= 4'h0;
end
  
  //---------------------------------------------------------------------------------------------------------------
    
     if ((pixel_x >= 625 && pixel_x <= 630 && pixel_y >= 26 && pixel_y <= 410) ||
        (pixel_x >= 540 && pixel_x <= 545 && pixel_y >= 86 && pixel_y <= 180) ||
        (pixel_x >= 540 && pixel_x <= 545 && pixel_y >= 240 && pixel_y <= 410) ||
        (pixel_x >= 320 && pixel_x <= 540 && pixel_y >= 240 && pixel_y <= 245)) begin 
        red <= 4'h0;
        green <= 4'h0;
        blue <= 4'hF;  // WHITE
    end
    
     if ((pixel_x >= 545 && pixel_x <= 625 && pixel_y >= 26 && pixel_y <= 410)) begin 
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // WHITE
    end
    
    if ((pixel_x >= 200 && pixel_x <= 625 && pixel_y >= 26 && pixel_y <= 31) ||
        (pixel_x >= 285 && pixel_x <= 540 && pixel_y >= 86 && pixel_y <= 91)) begin 
        red <= 4'h0;
        green <= 4'h0;
        blue <= 4'hF;  // WHITE
    end
    
    if ((pixel_x >= 195 && pixel_x <= 200 && pixel_y >= 26 && pixel_y <= 410) ||
        (pixel_x >= 200 && pixel_x <= 280 && pixel_y >= 156 && pixel_y <= 161) ||
        (pixel_x >= 200 && pixel_x <= 270 && pixel_y >= 256 && pixel_y <= 261)) begin 
        red <= 4'h0;
        green <= 4'h0;
        blue <= 4'hF;  // WHITE
    end
    
     if ((pixel_x >= 285 && pixel_x <= 540 && pixel_y >= 405 && pixel_y <= 410)) begin 
        red <= 4'h0;
        green <= 4'h0;
        blue <= 4'hF;  // WHITE
    end
    
    
end
endmodule