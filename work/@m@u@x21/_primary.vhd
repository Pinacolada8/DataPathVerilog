library verilog;
use verilog.vl_types.all;
entity MUX21 is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        controle        : in     vl_logic;
        S               : out    vl_logic_vector(31 downto 0)
    );
end MUX21;
