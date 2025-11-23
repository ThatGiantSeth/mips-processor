SetActiveLib -work
comp -include "$dsn\src\alu.vhd" 
comp -include "$dsn\src\TestBench\alu_TB.vhd" 
asim +access +r TESTBENCH_FOR_alu 
wave 
wave -noreg A
wave -noreg B
wave -noreg S2
wave -noreg S1
wave -noreg S0
wave -noreg status
wave -noreg Result
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\alu_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_alu 
