module ALUControl (ALUOp, FuncCode, ALUCt1);
  input[3:0] ALUOp;
  input[5:0] FuncCode;
  output reg[3:0] ALUCt1;
  
  always@(FuncCode or ALUOp)
  case(ALUOp)
    0: ALUCt1 <= 2;//lw e sw
    1: ALUCt1 <= 6;//beq
    2: case(FuncCode)
          0:ALUCt1 <= 15;//sll
          2:ALUCt1 <= 15;//srl
          8:ALUCt1 <= 15;//jump register
          32:ALUCt1 <= 2; //soma
          33:ALUCt1 <= 2;//soma unsigned
          34:ALUCt1 <= 6; //subtrai
          35:ALUCt1 <= 6; //subtract unsigned
          36:ALUCt1 <= 0; //and
          37:ALUCt1 <= 1; //or
          39:ALUCt1 <= 12; //nor
          42:ALUCt1 <= 7; //slt
          43:ALUCt1 <= 15; //sltu
         default:ALUCt1 <= 15;
       endcase
    3: ALUCt1 <= 2;//Addi
    4: ALUCt1 <= 7;//Slti
    5: ALUCt1 <= 0; //andi
    6: ALUCt1 <= 1; //ori
    7: ALUCt1 <= 11; //lui
  endcase
endmodule