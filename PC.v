module PC(input [31:0] LoadD, input clk, rst, output reg [31:0] out);
  always@(posedge clk, posedge rst)
  if(rst)
    out <= 0;
  else
    out <= LoadD;
endmodule
