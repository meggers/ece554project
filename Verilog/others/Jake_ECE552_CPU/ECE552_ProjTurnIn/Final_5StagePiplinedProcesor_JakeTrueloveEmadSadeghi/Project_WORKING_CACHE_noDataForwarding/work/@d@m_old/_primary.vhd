library verilog;
use verilog.vl_types.all;
entity DM_old is
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector(15 downto 0);
        re              : in     vl_logic;
        we              : in     vl_logic;
        wrt_data        : in     vl_logic_vector(15 downto 0);
        rd_data         : out    vl_logic_vector(15 downto 0)
    );
end DM_old;
