library verilog;
use verilog.vl_types.all;
entity Deslocador is
    port(
        valor           : in     vl_logic_vector(25 downto 0);
        quantia         : in     vl_logic_vector(7 downto 0);
        saida           : out    vl_logic_vector(25 downto 0)
    );
end Deslocador;
