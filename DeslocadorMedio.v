module Deslocador(input[25:0] valor , input [7:0] quantia, output reg[25:0] saida);
 always@(*)
  begin
    saida = valor << quantia;  
  end 
endmodule