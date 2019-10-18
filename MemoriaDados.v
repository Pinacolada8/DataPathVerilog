module MemoriaDados(addr, data, wr_en, Clock, ReadData);
input [4:0] addr; 
input [31:0] data;
input wr_en, Clock;
output [31:0] ReadData;

reg [31:0] Mem [0:31];

assign ReadData = Mem[addr];

always @(posedge Clock)
begin
  if (wr_en) Mem[addr] = data;
  
end

endmodule
