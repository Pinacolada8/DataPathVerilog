module MUXReg(A, B, controle, S);
  input[4:0] A, B;
  input controle;
  output reg[4:0] S;
  
  always@(controle)
    begin
      case(controle)
        0: S <= A;
        1: S <= B;
      endcase
    end
  
endmodule
