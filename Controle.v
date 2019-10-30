module Controle(OpCode, RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
  input[5:0] OpCode;
  output reg[1:0] ALUOp;
  output reg RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  
  
  always@(OpCode)
  case(OpCode)
    0:begin//R-format
      RegDst <= 1;
      Jump <= 0;
      Branch <= 0;
      MemRead <= 0;
      MemtoReg <= 0;
      ALUOp <= 2;
      MemWrite <= 0;
      ALUSrc <= 0;
      RegWrite <= 1;
    end 
    2:begin//Jump
      RegDst <= 0;//Don't care
      Jump <= 1;
      Branch <= 0;
      MemRead <= 0;
      MemtoReg <= 0;//Don't care
      ALUOp <= 0;//Don't care
      MemWrite <= 0;
      ALUSrc <= 0;//Don't care
      RegWrite <= 0;
    end
    3:begin//jal
    end
    4:begin//beq
      RegDst <= 0;//Don't care
      Jump <= 0;
      Branch <= 1;
      MemRead <= 0;
      MemtoReg <= 0;//Don't care
      ALUOp <= 1;
      MemWrite <= 0;
      ALUSrc <= 0;
      RegWrite <= 0;
    end
    5:begin//bne
    end
    8:begin//addi
    end
    9:begin//addiu
    end
    10:begin//slti
    end
    11:begin//sltiu
    end
    12:begin//andi
    end
    13:begin//ori
    end
    15:begin//lui
    end
    35:begin//LW
      RegDst <= 0;
      Jump <= 0;
      Branch <= 0;
      MemRead <= 1;
      MemtoReg <= 1;
      ALUOp <= 0;
      MemWrite <= 0;
      ALUSrc <= 1;
      RegWrite <= 1;
    end
    36:begin//lbu
    end
    37:begin//lhu
    end
    40:begin//Sb
    end
    41:begin//sh
    end
    43:begin//SW
      RegDst <= 0;//Don't care
      Jump <= 0;
      Branch <= 0;
      MemRead <= 0;
      MemtoReg <= 0;//Don't care
      ALUOp <= 0;
      MemWrite <= 1;
      ALUSrc <= 1;
      RegWrite <= 0;
    end
    48:begin//ll
    end
    56:begin//sc
    end
  endcase
endmodule