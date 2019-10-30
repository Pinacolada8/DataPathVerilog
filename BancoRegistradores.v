module BancoRegistradores(Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clk);
input[4:0] Read1, Read2, WriteReg;//Registradores para leitura e escrita
input[31:0] WriteData;//Dados a serem escritos
input RegWrite, clk;//Controle da escrita e clock
output[31:0] Data1, Data2;//Dados lidos dos registradores Read1 e Read2

reg[31:0] RF [31:0];

assign Data1 = RF[Read1];
assign Data2 = RF[Read2];

initial 
begin
  RF[5'h0] = 32'h0;
  RF[5'h1] = 32'h0;
  RF[5'h2] = 32'h0;
  RF[5'h3] = 32'h0; 
  RF[5'h4] = 32'h0;
  RF[5'h5] = 32'h0;
  RF[5'h6] = 32'h0;
  RF[5'h7] = 32'h0;
  RF[5'h8] = 32'h0; 
  RF[5'h9] = 32'h0;
  RF[5'ha] = 32'h0;
  RF[5'hb] = 32'h0;
  RF[5'hc] = 32'h0;
  RF[5'hd] = 32'h0; 
  RF[5'he] = 32'h0;
  RF[5'hf] = 32'h0;
  RF[5'h10] = 32'h0;
  RF[5'h11] = 32'h0;
  RF[5'h12] = 32'h0; 
  RF[5'h13] = 32'h0;
  RF[5'h14] = 32'h0;
  RF[5'h15] = 32'h0;
  RF[5'h16] = 32'h0;
  RF[5'h17] = 32'h0; 
  RF[5'h18] = 32'h0;
  RF[5'h19] = 32'h0;
  RF[5'h1a] = 32'h0;
  RF[5'h1b] = 32'h0;
  RF[5'h1c] = 32'h0; 
  RF[5'h1d] = 32'h0;
  RF[5'h1e] = 32'h0;
  RF[5'h1f] = 32'h0;
  RF[5'h20] = 32'h0;
end


always@(posedge clk)
  begin
    if(RegWrite)
      RF[WriteReg] <= WriteData;  
  end
endmodule