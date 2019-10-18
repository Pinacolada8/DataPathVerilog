library verilog;
use verilog.vl_types.all;
entity MemoriaDados is
    port(
        addr            : in     vl_logic_vector(4 downto 0);
        data            : in     vl_logic_vector(31 downto 0);
        wr_en           : in     vl_logic;
        Clock           : in     vl_logic;
        ReadData        : out    vl_logic_vector(31 downto 0)
    );
end MemoriaDados;
