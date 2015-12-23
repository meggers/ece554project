library verilog;
use verilog.vl_types.all;
entity Full_processor is
    port(
        instr           : in     vl_logic_vector(15 downto 0);
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        R0              : out    vl_logic_vector(15 downto 0);
        R1              : out    vl_logic_vector(15 downto 0);
        R2              : out    vl_logic_vector(15 downto 0);
        R3              : out    vl_logic_vector(15 downto 0);
        R4              : out    vl_logic_vector(15 downto 0);
        R5              : out    vl_logic_vector(15 downto 0);
        R6              : out    vl_logic_vector(15 downto 0);
        R7              : out    vl_logic_vector(15 downto 0);
        R8              : out    vl_logic_vector(15 downto 0);
        R9              : out    vl_logic_vector(15 downto 0);
        R10             : out    vl_logic_vector(15 downto 0);
        R11             : out    vl_logic_vector(15 downto 0);
        R12             : out    vl_logic_vector(15 downto 0);
        R13             : out    vl_logic_vector(15 downto 0);
        R14             : out    vl_logic_vector(15 downto 0);
        R15             : out    vl_logic_vector(15 downto 0);
        PC              : out    vl_logic_vector(15 downto 0);
        IFID            : out    vl_logic_vector(15 downto 0);
        N_ff            : out    vl_logic;
        V_ff            : out    vl_logic;
        Z_ff            : out    vl_logic
    );
end Full_processor;
