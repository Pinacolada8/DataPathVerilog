module DataPath(input clk, rst);
  wire[31:0] data, endereco, instrucao, saidamuxposbanco, saidaALU, writeData, extendedShifted, ALUres, saidaSomadorPC, data1, data2, jumpAddress, BranchRes;  
  wire[25:0] enderecoJump;
  wire[6:0] enderecoShifted;
  wire[4:0] writeReg;
  wire[3:0] ALUControl;
  wire controle, regDst, ALUSrc, zero, MemRead, MemtoReg, regWrite, PCSrc, jump;


  PC pc(data, clk, rst, endereco);
  
  MemoriaInstrucao instmem(endereco[6:2], clk, instrucao);
  
  Somador PCJump(endereco, 32'b10, saidaSomadorPC);
  
  DeslocadorMedio(instrucao[25:0], 8'b10, enderecoJump);
  
  assign jumpAddress = {enderecoJump, 2'b00};
  assign jumpAddress[31:28] = saidaSomadorPC[31:28];
   
  MUXReg muxreg(instrucao[20:16], instrucao[15:11], regDst, writeReg);//Mux 2-1 de 5 bits criado especialmente para essa funcao
  
  BancoRegistradores(instrucao[25:21], instrucao[20:16], writeReg, writeData, regWrite, data1, data2, clk);
  
  MUX21 muxposbanco(data2, {{16{instrucao[15]}}, instrucao[15:0]}, ALUSrc, saidamuxposbanco);//Extensão de sinal
  
  ALUControl alucontrol(ALUOp, instrucao[5:0], ALUControl);  
  
  ALU alu(ALUControl, data1, saidamuxposbanco, saidaALU, zero);
  
  MemoriaDados memData(saidaALU, data2, MemRead, clk, ReadData);
  
  MUX21 muxposMemData(saidaALU, ReadData, MemtoReg, writeData);

  Deslocador desl({{16{instrucao[15]}}, instrucao[15:0]}, 8'b10, extendedShifted);
   
  Somador branchAdder(saidaSomadorPC, extendedShifted, ALUres);
  
  MUX21 muxBranch(saidaSomadorPC, ALUres, PCSrc, BranchRes);
  
  MUX21 muxNewPC(BranchRes, jumpAddress, jump, data);
endmodule
