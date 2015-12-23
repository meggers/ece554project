library verilog;
use verilog.vl_types.all;
entity Cntrl_Mem_SM is
    port(
        hit             : in     vl_logic;
        we_icache       : out    vl_logic;
        re_icache       : out    vl_logic;
        pc_stop_icache_mem: out    vl_logic;
        rdy_mem         : in     vl_logic;
        we_mem          : out    vl_logic;
        re_mem          : out    vl_logic;
        no_op_icache    : out    vl_logic;
        addr_icache     : in     vl_logic_vector(15 downto 0);
        rst             : in     vl_logic;
        rd_data_mem     : in     vl_logic_vector(31 downto 0);
        wr_data_icache  : out    vl_logic_vector(63 downto 0);
        addr_mem        : out    vl_logic_vector(14 downto 0);
        clk             : in     vl_logic;
        rd_data_icache  : in     vl_logic_vector(63 downto 0);
        instr           : out    vl_logic_vector(15 downto 0);
        instr_go        : out    vl_logic
    );
end Cntrl_Mem_SM;
