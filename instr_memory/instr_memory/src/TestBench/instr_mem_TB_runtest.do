SetActiveLib -work
comp -include "$dsn\src\instr_mem.vhd" 
comp -include "$dsn\src\TestBench\instr_mem_TB.vhd" 
asim +access +r TESTBENCH_FOR_instr_mem 
wave 
wave -noreg addr
wave -noreg instruction
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\instr_mem_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_instr_mem 
