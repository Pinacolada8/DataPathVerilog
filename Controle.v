module Controle(OpCode, RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite,selectRaWire,zeroImm,extendType,bneSelect);
  input[5:0] OpCode;
  output reg[3:0] ALUOp;
  output reg RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,selectRaWire,zeroImm,extendType,bneSelect;
  
  
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
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 1;
      bneSelect <= 0; //Dont care
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
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 1;
      bneSelect <= 0; //Dont care
    end
    3:begin//jal
      RegDst <= 0;
      Jump <= 1;
      Branch <= 0;
      MemRead <= 0;
      MemtoReg <= 0;
      ALUOp <= 3;//Verificar
      MemWrite <= 0;
      ALUSrc <= 1;
      RegWrite <= 1;
      selectRaWire <= 1;
      zeroImm <= 1;
      extendType <= 1;
      bneSelect <= 0; //Dont care
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
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 1;
      bneSelect <= 0;
    end
    5:begin//bne
      RegDst <= 0;//Don't care
      Jump <= 0;
      Branch <= 1;
      MemRead <= 0;
      MemtoReg <= 0;//Don't care
      ALUOp <= 1;
      MemWrite <= 0;
      ALUSrc <= 0;
      RegWrite <= 0;
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 1;
      bneSelect <= 1;
    end
    8:begin//addi
      RegDst <= 0;
      Jump <= 0;
      Branch <= 0;
      MemRead <= 0;
      MemtoReg <= 0;
      ALUOp <= 3;
      MemWrite <= 0;
      ALUSrc <= 1;
      RegWrite <= 1;
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 1;
      bneSelect <= 0; //Dont care
    end
    9:begin//addiu  TESTAR*********
      RegDst <= 0;
      Jump <= 0;
      Branch <= 0;
      MemRead <= 0;
      MemtoReg <= 0;
      ALUOp <= 3;
      MemWrite <= 0;
      ALUSrc <= 1;
      RegWrite <= 1;
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 0;
      bneSelect <= 0; //Dont care
    end
    10:begin//slti
      RegDst <= 0;
      Jump <= 0;
      Branch <= 0;
      MemRead <= 0;
      MemtoReg <= 0;
      ALUOp <= 3;//Verificar
      MemWrite <= 0;
      ALUSrc <= 1;
      RegWrite <= 1;
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 1;
      bneSelect <= 0; //Dont care
    end
    11:begin//sltiu TESTAR*********
      RegDst <= 0;
      Jump <= 0;
      Branch <= 0;
      MemRead <= 0;
      MemtoReg <= 0;
      ALUOp <= 3;//Verificar
      MemWrite <= 0;
      ALUSrc <= 1;
      RegWrite <= 1;
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 1;
      bneSelect <= 0; //Dont care
    end
    12:begin//andi
      RegDst <= 0;
      Jump <= 0;
      Branch <= 0;
      MemRead <= 0;
      MemtoReg <= 0;
      ALUOp <= 5;//Verificar
      MemWrite <= 0;
      ALUSrc <= 1;
      RegWrite <= 1;
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 0;
      bneSelect <= 0; //Dont care
    end
    13:begin//ori
      RegDst <= 0;
      Jump <= 0;
      Branch <= 0;
      MemRead <= 0;
      MemtoReg <= 0;
      ALUOp <= 6;//Verificar
      MemWrite <= 0;
      ALUSrc <= 1;
      RegWrite <= 1;
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 0;
      bneSelect <= 0; //Dont care
    end
    15:begin//lui
      RegDst <= 0;
      Jump <= 0;
      Branch <= 0;
      MemRead <= 0;
      MemtoReg <= 0;
      ALUOp <= 7;//Verificar
      MemWrite <= 0;
      ALUSrc <= 1;
      RegWrite <= 1;
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 1;
      bneSelect <= 0; //Dont care
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
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 1;
      bneSelect <= 0; //Dont care
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
      selectRaWire <= 0;
      zeroImm <= 0;
      extendType <= 1;
    end
    48:begin//ll
    end
    56:begin//sc
    end
  endcase
endmodule