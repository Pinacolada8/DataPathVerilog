module MUX21(A, B, controle, S);
  input[31:0] A, B;
  input controle;
  output reg[31:0] S;
  
  always@(A or B or controle)
    begin
      case(controle)
        0: S <= A;
        1: S <= B;
      endcase
    end
  
endmodule
