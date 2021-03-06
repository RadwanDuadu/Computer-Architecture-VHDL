# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/mradw/Desktop/2018-ECE/HDL/1bit_adder/1bit_adder.cache/wt [current_project]
set_property parent.project_path C:/Users/mradw/Desktop/2018-ECE/HDL/1bit_adder/1bit_adder.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:zybo:part0:1.0 [current_project]
set_property ip_output_repo c:/Users/mradw/Desktop/2018-ECE/HDL/1bit_adder/1bit_adder.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib C:/Users/mradw/Desktop/2018-ECE/HDL/1bit_adder/1bit_adder.srcs/sources_1/new/gates.vhd
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Xilinx/Vivado/2017.2/data/boards/board_files/zybo/ZYBO_Master.xdc
set_property used_in_implementation false [get_files C:/Xilinx/Vivado/2017.2/data/boards/board_files/zybo/ZYBO_Master.xdc]


synth_design -top gates -part xc7z010clg400-1


write_checkpoint -force -noxdef gates.dcp

catch { report_utilization -file gates_utilization_synth.rpt -pb gates_utilization_synth.pb }
