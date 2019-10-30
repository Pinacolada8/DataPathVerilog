module BancoRegistradores(Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clk);
input[4:0] Read1, Read2, WriteReg;//Registradores para leitura e escrita
input[31:0] WriteData;//Dados a serem escritos
input RegWrite, clk;//Controle da escrita e clock
output[31:0] Data1, Data2;//Dados lidos dos registradores Read1 e Read2

reg[31:0] RF [31:0];

assign Data1 = RF[Read1];
assign Data2 = RF[Read2];

always@(posedge clk)
  begin
    if(RegWrite)
      RF[WriteReg] <= WriteData;  
  end
endmodule