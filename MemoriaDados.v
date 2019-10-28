module MemoriaDados(addr, data, wr_en, re_en, Clock, ReadData);
input [4:0] addr; 
input [31:0] data;
input wr_en, re_en, Clock;
output reg [31:0] ReadData;

reg [31:0] Mem [0:31];

always @(posedge Clock)
begin
  if (wr_en) Mem[addr] = data;
  if (re_en) ReadData = Mem[addr];
end

endmodule
