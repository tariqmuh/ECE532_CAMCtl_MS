library verilog;
use verilog.vl_types.all;
entity vmodcam_tb is
    generic(
        state1          : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        state2          : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        state3          : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        state4          : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of state1 : constant is 1;
    attribute mti_svvh_generic_type of state2 : constant is 1;
    attribute mti_svvh_generic_type of state3 : constant is 1;
    attribute mti_svvh_generic_type of state4 : constant is 1;
end vmodcam_tb;
