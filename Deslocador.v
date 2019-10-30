module Deslocador(input[31:0] valor , input [7:0] quantia, output reg[31:0] saida);
 always@(*)
  begin
    saida = valor << quantia;  
  end 
endmodule