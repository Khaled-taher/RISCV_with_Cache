set design_name "Top"

file mkdir ../${design_name}
file mkdir ../${design_name}/outputs/
file mkdir ../${design_name}/reports/
#
#read_file -format verilog  ../src/${design_name}.v
analyze -library WORK -format verilog "../src/${design_name}.v"
elaborate ${design_name} -library WORK
link
#
source ../cons/const.tcl
#
#
write -f ddc -hierarchy -output ../${design_name}/outputs/unmapped_${design_name}.ddc   		
compile_ultra -exact_map 
#
#
report_area > ../${design_name}/reports/synth_area.rpt
report_cell > ../${design_name}/reports/synth_cells.rpt
report_qor  > ../${design_name}/reports/synth_qor.rpt
report_resources > ../${design_name}/reports/synth_resources.rpt
report_timing -max_paths 10 > ../${design_name}/reports/synth_timing.rpt
report_qor > ../${design_name}/reports/synth_qor.rpt 
#
#
write_sdc  ../${design_name}/outputs/${design_name}.sdc 
#
define_name_rules  no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri	 true
set verilogout_equation  false
#
#
write -f ddc -hierarchy -output ../${design_name}/outputs/${design_name}.ddc   
write_sdf "../${design_name}/outputs/${design_name}.sdf" 
write -hierarchy -format verilog -output ../${design_name}/outputs/syn_${design_name}.v

#

