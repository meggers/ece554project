library verilog;
use verilog.vl_types.all;
entity regFile is
    port(
        clk             : in     vl_logic;
        p0_addr         : in     vl_logic_vector(3 downto 0);
        p1_addr         : in     vl_logic_vector(3 downto 0);
        p0              : out    vl_logic_vector(15 downto 0);
        p1              : out    vl_logic_vector(15 downto 0);
        re0             : in     vl_logic;
        re1             : in     vl_logic;
        dst_addr        : in     vl_logic_vector(3 downto 0);
        dst             : in     vl_logic_vector(15 downto 0);
        we              : in     vl_logic;
        hlt             : in     vl_logic
    );
end regFile;
