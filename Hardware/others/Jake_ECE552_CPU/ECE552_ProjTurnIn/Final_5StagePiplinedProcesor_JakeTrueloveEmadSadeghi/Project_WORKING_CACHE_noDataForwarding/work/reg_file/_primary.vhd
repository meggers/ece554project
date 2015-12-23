library verilog;
use verilog.vl_types.all;
entity reg_file is
    port(
        p0              : out    vl_logic_vector(15 downto 0);
        p1              : out    vl_logic_vector(15 downto 0);
        re0             : in     vl_logic;
        re1             : in     vl_logic;
        p0_addr         : in     vl_logic_vector(3 downto 0);
        p1_addr         : in     vl_logic_vector(3 downto 0);
        dst_addr        : in     vl_logic_vector(3 downto 0);
        dst             : in     vl_logic_vector(15 downto 0);
        WE              : in     vl_logic;
        clk             : in     vl_logic;
        bus_out0        : out    vl_logic_vector(15 downto 0);
        bus_out1        : out    vl_logic_vector(15 downto 0);
        bus_out2        : out    vl_logic_vector(15 downto 0);
        bus_out3        : out    vl_logic_vector(15 downto 0);
        bus_out4        : out    vl_logic_vector(15 downto 0);
        bus_out5        : out    vl_logic_vector(15 downto 0);
        bus_out6        : out    vl_logic_vector(15 downto 0);
        bus_out7        : out    vl_logic_vector(15 downto 0);
        bus_out8        : out    vl_logic_vector(15 downto 0);
        bus_out9        : out    vl_logic_vector(15 downto 0);
        bus_out10       : out    vl_logic_vector(15 downto 0);
        bus_out11       : out    vl_logic_vector(15 downto 0);
        bus_out12       : out    vl_logic_vector(15 downto 0);
        bus_out13       : out    vl_logic_vector(15 downto 0);
        bus_out14       : out    vl_logic_vector(15 downto 0);
        bus_out15       : out    vl_logic_vector(15 downto 0)
    );
end reg_file;
