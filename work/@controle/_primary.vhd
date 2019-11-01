library verilog;
use verilog.vl_types.all;
entity Controle is
    port(
        OpCode          : in     vl_logic_vector(5 downto 0);
        RegDst          : out    vl_logic;
        Jump            : out    vl_logic;
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemtoReg        : out    vl_logic;
        ALUOp           : out    vl_logic_vector(3 downto 0);
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic;
        selectRaWire    : out    vl_logic;
        zeroImm         : out    vl_logic;
        extendType      : out    vl_logic;
        bneSelect       : out    vl_logic
    );
end Controle;
