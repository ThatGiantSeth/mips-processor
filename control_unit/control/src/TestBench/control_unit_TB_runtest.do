SetActiveLib -work
comp -include "$dsn\src\control_unit.vhd" 
comp -include "$dsn\src\TestBench\control_unit_TB.vhd" 
asim +access +r TESTBENCH_FOR_control_unit 
wave 
wave -noreg op
wave -noreg ImmToReg
wave -noreg ReadSrc
wave -noreg RegWrite
wave -noreg MemRead
wave -noreg MemtoReg
wave -noreg MemWrite
wave -noreg ALUOp
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\control_unit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_control_unit 
