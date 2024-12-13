`timescale 1ns / 1ps
module v_counter(
input clk,
output reg [9:0] v_count, 
input enable_v
);
initial v_count=0;
always @ (posedge clk)
 begin
  if (v_count<524)
   begin
     if (enable_v==1)
   begin
     v_count <= v_count+1;
    end
   end
else
begin
v_count <= 0;
end
end
endmodule