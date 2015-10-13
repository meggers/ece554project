library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        N               : out    vl_logic;
        Z               : out    vl_logic;
        V               : out    vl_logic;
        ALU_in1         : in     vl_logic_vector(15 downto 0);
        ALU_in2         : in     vl_logic_vector(15 downto 0);
        ALU_out         : out    vl_logic_vector(15 downto 0);
        op              : in     vl_logic_vector(3 downto 0)
    );
end ALU;
