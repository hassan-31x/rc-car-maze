`timescale 1ns / 1ps
module pixel_gen(
//inputs and outputs as usual,
input clk_d,
input [9:0] pixel_x,
input [9:0] pixel_y,
input video_on,
output reg [3:0] red = 0,
output reg [3:0] green = 0,
output reg [3:0] blue = 0
);
reg [3:0] white = 0;
always @(posedge clk_d) begin

begin
red <= 4'hF;  //black
green <= 4'h0;
blue <= 4'h0;
end

 // C
    if ((pixel_x >= 100 && pixel_x <= 129 && pixel_y >= 100 && pixel_y <= 109) ||   // Upper horizontal line
        (pixel_x >= 100 && pixel_x <= 109 && pixel_y >= 110 && pixel_y <= 149) ||   // Left vertical line
        (pixel_x >= 100 && pixel_x <= 129 && pixel_y >= 150 && pixel_y <= 159)) begin  // Lower horizontal line
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // Blue
    end

// A (Copied from "CAR" A)
    if ((pixel_x >= 140 && pixel_x <= 149 && pixel_y >= 100 && pixel_y <= 159) ||   // Left vertical line
        (pixel_x >= 150 && pixel_x <= 165 && pixel_y >= 100 && pixel_y <= 109) ||   // Upper horizontal line
        (pixel_x >= 166 && pixel_x <= 175 && pixel_y >= 100 && pixel_y <= 159) ||   // Right vertical line
        (pixel_x >= 150 && pixel_x <= 165 && pixel_y >= 130 && pixel_y <= 139)) begin // Lower horizontal line
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // Blue
    end

   // R
    if ((pixel_x >= 185 && pixel_x <= 194 && pixel_y >= 100 && pixel_y <= 159) ||   // Left vertical line
        (pixel_x >= 195 && pixel_x <= 219 && pixel_y >= 100 && pixel_y <= 109) ||   // Upper horizontal line
        (pixel_x >= 210 && pixel_x <= 219 && pixel_y >= 100 && pixel_y <= 129) ||   // Right upper vertical line
        (pixel_x >= 195 && pixel_x <= 219 && pixel_y >= 129 && pixel_y <= 138) ||   // Lower horizontal line
        (pixel_x >= 205 && pixel_x <= 214 && pixel_y >= 138 && pixel_y <= 159)) begin // Right lower vertical line
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // Blue
    end

    // M
    if ((pixel_x >= 250 && pixel_x <= 259 && pixel_y >= 100 && pixel_y <= 159) ||   // Left vertical line
        (pixel_x >= 260 && pixel_x <= 275 && pixel_y >= 100 && pixel_y <= 109) ||   // Upper horizontal line
        (pixel_x >= 274 && pixel_x <= 284 && pixel_y >= 100 && pixel_y <= 159) ||
        (pixel_x >= 285 && pixel_x <= 300 && pixel_y >= 100 && pixel_y <= 109) ||   // Second upper horizontal line
        (pixel_x >= 300 && pixel_x <= 309 && pixel_y >= 100 && pixel_y <= 159)) begin  // Right vertical line
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // Blue
    end

    // A
    if ((pixel_x >= 320 && pixel_x <= 329 && pixel_y >= 100 && pixel_y <= 159) ||   // Left vertical line
        (pixel_x >= 330 && pixel_x <= 345 && pixel_y >= 100 && pixel_y <= 109) ||   // Upper horizontal line
        (pixel_x >= 346 && pixel_x <= 355 && pixel_y >= 100 && pixel_y <= 159) ||   // Right vertical line
        (pixel_x >= 330 && pixel_x <= 345 && pixel_y >= 130 && pixel_y <= 139)) begin // Lower horizontal line
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // Blue
    end

    // For 'Z'
    if ((pixel_x >= 370 && pixel_x <= 399 && pixel_y >= 100 && pixel_y <= 109) ||  // Top horizontal line
        (pixel_x >= 389 && pixel_x <= 399 && pixel_y >= 110 && pixel_y <= 119) ||  // Diagonal upper-right to lower-left
        (pixel_x >= 385 && pixel_x <= 395 && pixel_y >= 120 && pixel_y <= 129) ||  // Diagonal upper-right to lower-left
        (pixel_x >= 375 && pixel_x <= 385 && pixel_y >= 130 && pixel_y <= 139) ||  // Diagonal upper-right to lower-left
        (pixel_x >= 370 && pixel_x <= 380 && pixel_y >= 140 && pixel_y <= 149) ||  // Diagonal upper-right to lower-left
        (pixel_x >= 370 && pixel_x <= 399 && pixel_y >= 150 && pixel_y <= 159)) begin // Bottom horizontal line
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // Blue for 'Z'
    end
    

    // E
    if ((pixel_x >= 410 && pixel_x <= 419 && pixel_y >= 100 && pixel_y <= 156) ||  // Left vertical line
        (pixel_x >= 420 && pixel_x <= 444 && pixel_y >= 100 && pixel_y <= 106) ||  // Upper horizontal line
        (pixel_x >= 420 && pixel_x <= 444 && pixel_y >= 125 && pixel_y <= 131) ||  // Mid horizontal line
        (pixel_x >= 420 && pixel_x <= 444 && pixel_y >= 150 && pixel_y <= 156)) begin  // Bottom horizontal line
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // Blue
    end

    // GAME (2nd line of text)
    // G
    if ((pixel_x >= 100 && pixel_x <= 129 && pixel_y >= 200 && pixel_y <= 209) ||   // Upper horizontal line
        (pixel_x >= 100 && pixel_x <= 109 && pixel_y >= 210 && pixel_y <= 249) ||   // Left vertical line
        (pixel_x >= 100 && pixel_x <= 129 && pixel_y >= 250 && pixel_y <= 259) ||  // Lower horizontal line
        (pixel_x >= 120 && pixel_x <= 129 && pixel_y >= 230 && pixel_y <= 249)) begin // Right vertical line
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // Blue
    end
    
        
    // A
    if ((pixel_x >= 140 && pixel_x <= 149 && pixel_y >= 200 && pixel_y <= 259) ||   // Left vertical line
        (pixel_x >= 150 && pixel_x <= 165 && pixel_y >= 200 && pixel_y <= 209) ||   // Upper horizontal line
        (pixel_x >= 166 && pixel_x <= 175 && pixel_y >= 200 && pixel_y <= 259) ||   // Right vertical line
        (pixel_x >= 150 && pixel_x <= 165 && pixel_y >= 230 && pixel_y <= 239)) begin // Lower horizontal line
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // Blue
    end

    // M
    if ((pixel_x >= 185 && pixel_x <= 194 && pixel_y >= 200 && pixel_y <= 259) ||   // Left vertical line
        (pixel_x >= 195 && pixel_x <= 215 && pixel_y >= 200 && pixel_y <= 209) ||   // Upper horizontal line
        (pixel_x >= 215 && pixel_x <= 224 && pixel_y >= 200 && pixel_y <= 259) ||
        (pixel_x >= 225 && pixel_x <= 245 && pixel_y >= 200 && pixel_y <= 209) ||   // Second upper horizontal line
        (pixel_x >= 245 && pixel_x <= 254 && pixel_y >= 200 && pixel_y <= 259)) begin  // Right vertical line
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // Blue
    end

  // E
    if ((pixel_x >= 260 && pixel_x <= 269 && pixel_y >= 200 && pixel_y <= 259) ||  // Left vertical line
        (pixel_x >= 270 && pixel_x <= 294 && pixel_y >= 200 && pixel_y <= 206) ||  // Upper horizontal line
        (pixel_x >= 270 && pixel_x <= 294 && pixel_y >= 225 && pixel_y <= 231) ||  // Mid horizontal line
        (pixel_x >= 270 && pixel_x <= 294 && pixel_y >= 250 && pixel_y <= 256)) begin  // Right vertical line
        red <= 4'h0;
        green <= 4'hF;
        blue <= 4'h0;  // Blue
    end 
    
end
endmodule