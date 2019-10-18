library verilog;
use verilog.vl_types.all;
entity MUXReg is
    port(
        A               : in     vl_logic_vector(4 downto 0);
        B               : in     vl_logic_vector(4 downto 0);
        controle        : in     vl_logic;
        S               : out    vl_logic_vector(4 downto 0)
    );
end MUXReg;
