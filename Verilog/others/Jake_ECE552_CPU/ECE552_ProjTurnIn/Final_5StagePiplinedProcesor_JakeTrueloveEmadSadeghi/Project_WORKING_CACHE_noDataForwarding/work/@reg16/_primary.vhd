library verilog;
use verilog.vl_types.all;
entity Reg16 is
    port(
        bus_out         : out    vl_logic_vector(15 downto 0);
        regWrite        : in     vl_logic;
        bus_in          : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic
    );
end Reg16;
