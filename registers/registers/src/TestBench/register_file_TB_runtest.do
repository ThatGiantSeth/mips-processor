SetActiveLib -work
comp -include "$dsn\src\register_file.vhd" 
comp -include "$dsn\src\TestBench\register_file_TB.vhd" 
asim +access +r TESTBENCH_FOR_register_file 
wave 
wave -noreg clk
wave -noreg reg_write
wave -noreg read_addr1
wave -noreg read_addr2
wave -noreg write_addr
wave -noreg write_data
wave -noreg read_data1
wave -noreg read_data2
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\register_file_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_register_file 
