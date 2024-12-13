`timescale 1ns / 1ps
module TopLevelModule_vga(
    input clk,
    input ir_pin1,
    input ir_pin2,
    input ir_pin3,
    input ir_pin4,
    input reset_button,  
    output h_sync,
    output v_sync,
    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue
);
    wire clk_d;
    wire trig_v;
    wire video_on;
    wire [9:0] h_count;
    wire [9:0] v_count;
    wire [9:0] x_loc;
    wire [9:0] y_loc;
    wire IR_OUT1;
    wire IR_OUT2;
    wire IR_OUT3;
    wire IR_OUT4;
    wire stop;
    wire start;
    wire check1;
    wire check2;
    
    reg maze_active= 0;

    // Timer logic
    reg [25:0] second_counter = 0;
    reg [3:0] units = 9;  // Start with 9 to decrement down to 0
    reg [3:0] tens = 9;   // Start with 9 to decrement down to 0
    reg start_flag = 0;    // Flag to keep track of when the game started
    reg checkpoint1_triggered = 0;  // Flag to track if checkpoint 1 was triggered
    reg checkpoint2_triggered = 0;  // Flag to track if checkpoint 2 was triggered
    wire sprite_on_units, sprite_on_tens;
    
    // Game Over flag
    reg game_over = 0;  // To detect when the timer hits 00

    // Reset signal from the button
    wire reset_game = reset_button;  // Directly assign button input to reset signal

    // Clock divider
    clk_div clkd(
        .clk(clk),
        .clk_d(clk_d)
    );

    // Horizontal and vertical counters
    h_counter hc(
        .clk(clk_d),
        .h_count(h_count),
        .trig_v(trig_v)
    );

    v_counter vc(
        .clk(clk_d),
        .enable_v(trig_v),
        .v_count(v_count)
    );

    // VGA synchronization
    vga_sync vgas(
        .h_count(h_count),
        .v_count(v_count),
        .h_sync(h_sync),
        .v_sync(v_sync),
        .video_on(video_on),
        .x_loc(x_loc),
        .y_loc(y_loc)
    );

    // IR sensor modules
    ir_sensor irs1(
        .ir_pin(ir_pin1),
        .IR_OUT(IR_OUT1)
    );
    ir_sensor irs2(
        .ir_pin(ir_pin2),
        .IR_OUT(IR_OUT2)
    );
    ir_sensor irs3(
        .ir_pin(ir_pin3),
        .IR_OUT(IR_OUT3)
    );
    ir_sensor irs4(
        .ir_pin(ir_pin4),
        .IR_OUT(IR_OUT4)
    );

    // Collision detection module
    car_collided starter(
        .IR_OUT(IR_OUT1),
        .car_collided(start)
    );

    car_collided stopper(
        .IR_OUT(IR_OUT2),
        .car_collided(stop)
    );
    
    car_collided checkpoint1(
        .IR_OUT(IR_OUT3),
        .car_collided(check1)
    );
    
    car_collided checkpoint2(
        .IR_OUT(IR_OUT4),
        .car_collided(check2)
    );

    // Gameplay screen
    wire [3:0] red_gameplay, green_gameplay, blue_gameplay;
    pixel_gen pg(
        .clk_d(clk_d),
        .pixel_x(x_loc),
        .pixel_y(y_loc),
        .video_on(video_on),
        .red(red_gameplay),
        .green(green_gameplay),
        .blue(blue_gameplay)
    );
    
    wire [3:0] red_maze, green_maze, blue_maze;
    maze m(
        .clk_d(clk_d),
        .pixel_x(x_loc),
        .pixel_y(y_loc),
        .video_on(video_on),
        .red(red_maze),
        .green(green_maze),
        .blue(blue_maze)
    );
    
    wire [3:0] red_checkpoint, green_checkpoint, blue_checkpoint;
    checkpoint1screen c1(
        .clk_d(clk_d),
        .pixel_x(x_loc),
        .pixel_y(y_loc),
        .video_on(video_on),
        .red(red_checkpoint),
        .green(green_checkpoint),
        .blue(blue_checkpoint)
    );
    
     wire [3:0] red_checkpoint2, green_checkpoint2, blue_checkpoint2;
    checkpoint2screen c2(
        .clk_d(clk_d),
        .pixel_x(x_loc),
        .pixel_y(y_loc),
        .video_on(video_on),
        .red(red_checkpoint2),
        .green(green_checkpoint2),
        .blue(blue_checkpoint2)
    );

    // Game Over screen
    wire [3:0] red_gameover, green_gameover, blue_gameover;
    game_over go(
        .clk_d(clk_d),
        .pixel_x(x_loc),
        .pixel_y(y_loc),
        .video_on(video_on),
        .red(red_gameover),
        .green(gameover),
        .blue(blue_gameover)
    );
  
    always @(posedge clk) begin
        if (reset_game) begin
            // Reset game when reset_game signal is high
            second_counter <= 0;
            units <= 9;
            tens <= 9;
            game_over <= 0;  // Reset game over flag when the reset button is pressed
            start_flag <= 0; // Reset the start flag
            maze_active<=0;
            checkpoint1_triggered <= 0;  // Reset checkpoint 1 flag
            checkpoint2_triggered <= 0;
//            start_flag<=1;  // Reset checkpoint 2 flag
        end else if (start && !start_flag) begin
            // When start sensor is triggered for the first time, set start_flag
            maze_active <= 1;
//            start_flag<=1;
        end else if (maze_active && !game_over && !stop) begin
            // Timer continues running once start_flag is set
            if (second_counter == 50_000_000) begin  // Adjust for a 50 MHz clock
                second_counter <= 0;
                if (units == 0 && tens == 0) begin
                    game_over <= 1;  // Set game_over flag when timer hits 00
                end else begin
                    if (units == 0) begin
                        units <= 9;  // Reset units to 9 when it hits 0
                        if (tens != 0) begin
                            tens <= tens - 1;  // Decrement tens
                        end
                    end else begin
                        units <= units - 1;  // Decrement units
                    end
                end
            end else begin
                second_counter <= second_counter + 1;
            end
        end

        // Check for stop sensor and set game_over flag
        if (stop) begin
            game_over <= 1;  // Set game over flag when stop sensor is triggered
        end

        // Check for checkpoint 1 trigger and add 10 seconds if not already triggered
        if (check1 && !checkpoint1_triggered) begin
            checkpoint1_triggered <= 1;  // Mark checkpoint 1 as triggered
            // Add 10 seconds to the timer
            if (tens < 9) begin
                tens <= tens + 1;  // Increment tens if it is less than 9
            end else if (tens == 9) begin
                tens <= 9;  // Ensure tens stay at 9 if they are already at 9
                units <= 9;  // Reset units to 0
            end
        end

        // Check for checkpoint 2 trigger and add 10 seconds if not already triggered
        if (check2 && !checkpoint2_triggered) begin
            checkpoint2_triggered <= 1;  // Mark checkpoint 2 as triggered
//            checkpoint1_triggered<=0;
            // Add 10 seconds to the timer
            if (tens < 9) begin
                tens <= tens + 1;  // Increment tens if it is less than 9
            end else if (tens == 9) begin
                tens <= 9;  // Ensure tens stay at 9 if they are already at 9
                units <= 9;  // Reset units to 0
            end
        end
    end


    // Numbers module for units digit
    numbers units_digit (
        .clk(clk),
        .xloc(x_loc),
        .yloc(y_loc),
        .charx(100),  // Position for units digit
        .chary(30),   // Vertical position of timer
        .num(units),
        .sprite_on(sprite_on_units)
    );

    // Numbers module for tens digit
    numbers tens_digit (
        .clk(clk),
        .xloc(x_loc),
        .yloc(y_loc),
        .charx(80),  // Position for tens digit
        .chary(30),   // Vertical position of timer
        .num(tens),
        .sprite_on(sprite_on_tens)
    );

    // Conditional logic for selecting outputs
    always @(*) begin
        if (game_over) begin
            // If game over, show the "Game Over" screen
            red = red_gameover;
            green = green_gameover;
            blue = blue_gameover;
        end else if (stop) begin
            // If a collision is detected, show the "Game Over" screen
            red = red_gameover;
            green = green_gameover;
            blue = blue_gameover;
        end
         else if (checkpoint2_triggered) begin
            // Otherwise, show the gameplay screen
            red = red_checkpoint2;
            green = green_checkpoint2;
            blue = blue_checkpoint2;
        end
        else if (checkpoint1_triggered) begin
            // Otherwise, show the gameplay screen
            red = red_checkpoint;
            green = green_checkpoint;
            blue = blue_checkpoint;
        end
        else if (maze_active) begin
            // Otherwise, show the gameplay screen
            red = red_maze;
            green = green_maze;
            blue = blue_maze;
        end
        
        else begin
            // Otherwise, show the gameplay screen
            red = red_gameplay;
            green = green_gameplay;
            blue = blue_gameplay;
        end

        // Always display the timer on the screen
        if (sprite_on_units || sprite_on_tens) begin
            // Show the timer digits in white (always visible)
            red = 4'hF;
            green = 4'hF;
            blue = 4'hF;
        end
    end
endmodule

