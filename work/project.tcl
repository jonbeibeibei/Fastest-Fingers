set projDir "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/planAhead"
set projName "Click Clock"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/mojo_top_0.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/reset_conditioner_1.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/button_conditioner_2.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/button_conditioner_2.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/edge_detector_4.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/edge_detector_4.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/edge_detector_4.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/clickreg_7.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/multi_seven_seg_8.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/multi_seven_seg_8.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/multi_dec_ctr_10.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/counter_11.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/pipeline_12.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/pipeline_12.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/alu_14.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/alu_14.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/alu_14.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/pn_gen_17.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/counter_18.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/seven_seg_19.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/decoder_20.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/counter_18.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/seven_seg_19.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/decoder_20.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/decimal_counter_24.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/compare_25.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/boolean_26.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/shifter_27.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/adder_28.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/compare_25.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/boolean_26.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/shifter_27.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/adder_28.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/compare_25.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/boolean_26.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/shifter_27.v" "C:/Users/jbz_1/OneDrive/Documents/mojo/Click Clock/work/verilog/adder_28.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/jbz_1/OneDrive/Documents/mojo/Click\ Clock/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
