module ALU(ALUctl, A, B, ALUOut, Zero);
  input[3:0] ALUctl;
  input[31:0] A,B;
  output reg [31:0] ALUOut;
  output Zero;
  
  assign Zero = (ALUOut == 0);
  
  always@(ALUctl, A, B)
    case(ALUctl)
      0:ALUOut <= A & B;//AND
      1:ALUOut <= A | B;//OR
      2:ALUOut <= A + B;//SOMA
      6:ALUOut <= A - B;//SUBTRACAO
      7:ALUOut<= A < B ? 1:0;//SET ON LESS THAN
      11:ALUOut<= B * 65536;//Transforma os 16Bits menos significativos nos mais significativos "lui"
      12:ALUOut <= ~(A | B);//NOR
      default: ALUOut <= 0;
    endcase
    
endmodule 