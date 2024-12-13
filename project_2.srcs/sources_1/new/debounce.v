`timescale 1ns / 1ps
module debounce(
    input clk,            // Clock signal
    input button,         // Raw button input
    output reg debounced_signal  // Cleaned button signal
);

    reg [3:0] debounce_counter;  // A counter for debouncing
    reg button_reg, button_stable;

    always @(posedge clk) begin
        button_reg <= button;  // Capture the button state

        if (button_reg == button_stable) begin
            debounce_counter <= debounce_counter + 1;
            if (debounce_counter == 4'b1111) begin  // Wait for 16 clock cycles
                debounced_signal <= button_stable;  // Update the debounced signal
            end
        end else begin
            debounce_counter <= 0;
            button_stable <= button_reg;  // Update the stable signal
        end
    end

endmodule

