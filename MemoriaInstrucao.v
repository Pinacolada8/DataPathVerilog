module MemoriaInstrucao(addr, clk, instruction);
input [4:0] addr;
input clk;
output [31:0] instruction;

reg [31:0] Mem [0:31];

initial 
begin
  Mem[5'h0] = 32'h22318003;//addi s1 s1 0x8003
  Mem[5'h1] = 32'h26528800;//addiu s2 s2 0x8800
  Mem[5'h2] = 32'h02329820;//add s3 s1 s2
  Mem[5'h3] = 32'h0251a022;//sub s4 s2 s1
  Mem[5'h4] = 32'h12930001;//beq s4 s3 0x1
  Mem[5'h5] = 32'h16930001;//bne s4 s3 0x1
  Mem[5'h6] = 32'h02329824;//and s3 s1 s2
  Mem[5'h7] = 32'h0232a025;//or s4 s1 s2
  Mem[5'h8] = 32'h02329827;//nor s3 s1 s2
  Mem[5'h9] = 32'h08000004;//Jump 0x4
end


assign instruction = Mem[addr];

endmodule
