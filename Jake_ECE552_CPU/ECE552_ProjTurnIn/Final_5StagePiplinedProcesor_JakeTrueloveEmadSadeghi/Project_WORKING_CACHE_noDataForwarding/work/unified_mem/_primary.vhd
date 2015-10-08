library verilog;
use verilog.vl_types.all;
entity unified_mem is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        addr            : in     vl_logic_vector(14 downto 0);
        re              : in     vl_logic;
        we              : in     vl_logic;
        wdata           : in     vl_logic_vector(31 downto 0);
        rd_data         : out    vl_logic_vector(31 downto 0);
        rdy             : out    vl_logic
    );
end unified_mem;
