library verilog;
use verilog.vl_types.all;
entity IM is
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector(15 downto 0);
        rd_en           : in     vl_logic;
        instr           : out    vl_logic_vector(15 downto 0)
    );
end IM;
