library verilog;
use verilog.vl_types.all;
entity cache is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        addr            : in     vl_logic_vector(13 downto 0);
        wr_data         : in     vl_logic_vector(63 downto 0);
        wdirty          : in     vl_logic;
        we              : in     vl_logic;
        re              : in     vl_logic;
        rd_data         : out    vl_logic_vector(63 downto 0);
        tag_out         : out    vl_logic_vector(10 downto 0);
        hit             : out    vl_logic;
        dirty           : out    vl_logic
    );
end cache;
