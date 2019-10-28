module MemoriaInstrucao(addr, clk, instruction);
input [4:0] addr;
input clk;
output [31:0] instruction;

reg [31:0] Mem [0:31];

initial 
begin
  Mem[5'h0] = 32'h02538820;//add
  Mem[5'h1] = 32'h02538822;//sub
  Mem[5'h2] = 32'h02538824;//and
  Mem[5'h3] = 32'h02538825;//or 
  Mem[5'h4] = 32'h02538827;//nor
end

assign instruction = Mem[addr];

endmodule
