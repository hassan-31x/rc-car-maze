`timescale 1ns / 1ps
module game_over(
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
    // Default to black
    red <= 4'h0;
    green <= 4'h0;
    blue <= 4'h0;

    // G
    if ((pixel_x >= 110 && pixel_x <= 139 && pixel_y >= 120 && pixel_y <= 129) ||   // Upper horizontal line
        (pixel_x >= 110 && pixel_x <= 119 && pixel_y >= 130 && pixel_y <= 169) ||   // Left vertical line
        (pixel_x >= 110 && pixel_x <= 139 && pixel_y >= 170 && pixel_y <= 179) ||   // Lower horizontal line
        (pixel_x >= 129 && pixel_x <= 139 && pixel_y >= 150 && pixel_y <= 179)) begin // Lower horizontal line
        red <= 4'hF;
        green <= 4'h0;
        blue <= 4'h0;  // Blue
    end

    // A
    if ((pixel_x >= 150 && pixel_x <= 159 && pixel_y >= 120 && pixel_y <= 179) ||   // Left vertical line
        (pixel_x >= 159 && pixel_x <= 174 && pixel_y >= 120 && pixel_y <= 129) ||   // Upper horizontal line
        (pixel_x >= 174 && pixel_x <= 183 && pixel_y >= 120 && pixel_y <= 179) ||   // Right vertical line
        (pixel_x >= 159 && pixel_x <= 174 && pixel_y >= 140 && pixel_y <= 149)) begin // Middle horizontal line
        red <= 4'hF;
        green <= 4'h0;
        blue <= 4'h0;  // Blue
    end

    // M
    if ((pixel_x >= 200 && pixel_x <= 209 && pixel_y >= 120 && pixel_y <= 179) ||   // Left vertical line
        (pixel_x >= 209 && pixel_x <= 229 && pixel_y >= 120 && pixel_y <= 129) ||   // Upper horizontal line
        (pixel_x >= 224 && pixel_x <= 233 && pixel_y >= 120 && pixel_y <= 179) ||   // Middle vertical line
        (pixel_x >= 229 && pixel_x <= 249 && pixel_y >= 120 && pixel_y <= 129) ||   // Second horizontal line
        (pixel_x >= 249 && pixel_x <= 258 && pixel_y >= 120 && pixel_y <= 179)) begin // Right vertical line
        red <= 4'hF;
        green <= 4'h0;
        blue <= 4'h0;  // Blue
    end

    // E
    if ((pixel_x >= 300 && pixel_x <= 309 && pixel_y >= 120 && pixel_y <= 179) ||   // Left vertical line
        (pixel_x >= 300 && pixel_x <= 329 && pixel_y >= 120 && pixel_y <= 129) ||   // Top horizontal line
        (pixel_x >= 300 && pixel_x <= 329 && pixel_y >= 144 && pixel_y <= 154) ||   // Middle horizontal line
        (pixel_x >= 300 && pixel_x <= 329 && pixel_y >= 170 && pixel_y <= 179)) begin // Bottom horizontal line
        red <= 4'hF;
        green <= 4'h0;
        blue <= 4'h0;  // Blue
    end

    // E
    if ((pixel_x >= 300 && pixel_x <= 309 && pixel_y >= 220 && pixel_y <= 279) ||   // Left vertical line
        (pixel_x >= 300 && pixel_x <= 329 && pixel_y >= 220 && pixel_y <= 229) ||   // Top horizontal line
        (pixel_x >= 300 && pixel_x <= 329 && pixel_y >= 244 && pixel_y <= 254) ||   // Middle horizontal line
        (pixel_x >= 300 && pixel_x <= 329 && pixel_y >= 270 && pixel_y <= 279)) begin // Bottom horizontal line
        red <= 4'hF;
        green <= 4'h0;
        blue <= 4'h0;  // Blue
    end

    // N
    if ((pixel_x >= 340 && pixel_x <= 349 && pixel_y >= 220 && pixel_y <= 279) ||   // Left vertical line
        (pixel_x >= 390 && pixel_x <= 399 && pixel_y >= 220 && pixel_y <= 279) ||   // Right vertical line
        (pixel_x >= 350 && pixel_x <= 389 && pixel_y >= 220 && pixel_y <= 229)) begin // Diagonal connecting line
        red <= 4'hF;
        green <= 4'h0;
        blue <= 4'h0;  // Blue
    end

    // D
    if ((pixel_x >= 430 && pixel_x <= 459 && pixel_y >= 220 && pixel_y <= 229) ||   // Upper horizontal line
        (pixel_x >= 430 && pixel_x <= 439 && pixel_y >= 230 && pixel_y <= 269) ||   // Left vertical line
        (pixel_x >= 430 && pixel_x <= 459 && pixel_y >= 270 && pixel_y <= 279) ||   // Lower horizontal line
        (pixel_x >= 449 && pixel_x <= 459 && pixel_y >= 230 && pixel_y <= 269)) begin // Right vertical line
        red <= 4'hF;
        green <= 4'h0;
        blue <= 4'h0;  // Blue
    end

    // E
    if ((pixel_x >= 470 && pixel_x <= 479 && pixel_y >= 220 && pixel_y <= 279) ||   // Left vertical line
        (pixel_x >= 470 && pixel_x <= 499 && pixel_y >= 220 && pixel_y <= 229) ||   // Top horizontal line
        (pixel_x >= 470 && pixel_x <= 499 && pixel_y >= 244 && pixel_y <= 254) ||   // Middle horizontal line
        (pixel_x >= 470 && pixel_x <= 499 && pixel_y >= 270 && pixel_y <= 279)) begin // Bottom horizontal line
        red <= 4'hF;
        green <= 4'h0;
        blue <= 4'h0;  // Blue
    end


	// D
    if ((pixel_x >= 530 && pixel_x <= 559 && pixel_y >= 220 && pixel_y <= 229) ||   // Upper horizontal line
        (pixel_x >= 530 && pixel_x <= 539 && pixel_y >= 230 && pixel_y <= 269) ||   // Left vertical line
        (pixel_x >= 530 && pixel_x <= 559 && pixel_y >= 270 && pixel_y <= 279) ||   // Lower horizontal line
        (pixel_x >= 549 && pixel_x <= 559 && pixel_y >= 230 && pixel_y <= 269)) begin // Right vertical line
        red <= 4'hF;
        green <= 4'h0;
        blue <= 4'h0;  // Blue
    end


end
endmodule