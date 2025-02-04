module DataPath(input clk, rst);
  wire[31:0] data, endereco, instrucao, saidamuxposbanco, saidamuxposbancoZero, ReadData, saidaALU, writeData, extendedShifted, ALUres, saidaSomadorPC, data1, data2, jumpAddress, BranchRes;  
  wire[27:0] enderecoJump;
  wire[4:0] writeReg,writeRegReal;
  wire[3:0] ALUControl;//Saida da ALUControl
  wire[3:0] ALUOp;//Uma das entradas da ALUControl
  wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, zero,selectRaWire,zeroImm,extendType,bneSelect;
  wire[15:0] extendUpPart;

  //Retorna o endereco da instrucao a ser executada
  PC pc(data, clk, rst, endereco);
  
  //Retorna a instrucao presente no endereco fornecido
  MemoriaInstrucao instmem(endereco[6:2], clk, instrucao);
  
  //Soma 4 ao PC para apontar para a proxima instrucao
  Somador PCJump(endereco, 32'b100, saidaSomadorPC);
  
  //Calculo do endereco do jump caso seja necessario
  assign enderecoJump = {instrucao[25:0], 2'b00};
  assign jumpAddress = {saidaSomadorPC[31:28], enderecoJump};
   
  //Gera os sinais de controle a partir do OpCode fornecido(instrucao[31:26])
  Controle control(instrucao[31:26], RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite,selectRaWire,zeroImm,extendType,bneSelect);
   
  //MUX que decide se o registrador a ser escrito � o rd (R-Format) ou rt (I-Format)
  MUXReg muxreg(instrucao[20:16], instrucao[15:11], RegDst, writeReg);//Mux 2-1 de 5 bits criado especialmente para essa funcao
  
  //Seleciona se o Registrador para escrever sera o "$ra" ou um registrador definido, utilizado em "jal"
  MUXReg selectRa(writeReg,5'b1,selectRaWire,writeRegReal);
  
  BancoRegistradores banco(instrucao[25:21], instrucao[20:16], writeRegReal, writeData, RegWrite, data1, data2, clk);
    
  //Define se o Immediate sera completado pelo Bit de Sinal ou por 0
  assign extendUpPart = ({16{extendType}} & {16{instrucao[15]}}); 
    
  //Define se a segunda entrada da ALU sera a segunda saida do banco de registradores ou o campo immediate extendido
  MUX21 muxposbanco(data2, {extendUpPart, instrucao[15:0]}, ALUSrc, saidamuxposbanco);//Extens�o de sinal
  
  //Define se ira utilizar o valor do Immediate ou simplesmente 0, Utilizado em "jal"
  MUX21 muxposbancoZero(saidamuxposbanco,32'b0, zeroImm, saidamuxposbancoZero);
  
  //Atraves do controle ALUOp gerado pelo controle e pela FunctCode (em instrucoes do tipo R) controla a operacao realizada pela ALU
  ALUControl alucontrol(ALUOp, instrucao[5:0], ALUControl);  
  
  ALU alu(ALUControl, data1, saidamuxposbancoZero, saidaALU, zero);
  
  MemoriaDados memData(saidaALU[4:0], data2, MemWrite, MemRead, clk, ReadData);
  
  //Define se o que vai ser escrito no banco de registradores e o valor calculado pela ALU ou um valor fornecido pela memoria de dados(Load).
  MUX21 muxposMemData(saidaALU, ReadData, MemtoReg, writeData);//Verificar saidaALU[4:0]

  Deslocador desl({{16{instrucao[15]}}, instrucao[15:0]}, 8'b10, extendedShifted);
   
  Somador branchAdder(saidaSomadorPC, extendedShifted, ALUres);
  
  //A variavel "bneSelect" seleciona se e necessario ser igual ou diferente para mudar o PC usando por "bne" e "beq"
  MUX21 muxBranch(saidaSomadorPC, ALUres, Branch & ((zero & !bneSelect)|(!zero & bneSelect)), BranchRes);
  
  MUX21 muxNewPC(BranchRes, jumpAddress, Jump, data);
endmodule
