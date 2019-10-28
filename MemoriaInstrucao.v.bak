module MemoriaInstrucao(addr, clk, instruction);
input [4:0] addr;
input clk;
output [31:0] instruction;

reg [31:0] Mem [0:31];

initial 
begin
  Mem[5'h0] = 32'hf000;
  Mem[5'h1] = 32'h0f00;
  Mem[5'h2] = 32'h00f0;
  Mem[5'h3] = 32'h000f;  
end

assign instruction = Mem[addr];

endmodule
