module ALUControl (ALUOp, FuncCode, ALUCt1);
  input[1:0] ALUOp;
  input[5:0] FuncCode;
  output reg[3:0] ALUCt1;
  
  always@(FuncCode or ALUOp)
  case(ALUOp)
    0: ALUCt1 <= 2;//lw e sw
    1: ALUCt1 <= 6;//beq
    2: case(FuncCode)
          32:ALUCt1 <= 2; //soma
          34:ALUCt1 <= 6; //subtrai
          36:ALUCt1 <= 0; //and
          37:ALUCt1 <= 1; //or
          39:ALUCt1 <= 12; //nor
          42:ALUCt1 <= 7; //slt
         default:ALUCt1 <= 15;
       endcase
  endcase
endmodule