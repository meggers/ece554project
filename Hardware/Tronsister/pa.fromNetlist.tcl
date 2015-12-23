
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Tronsistor -dir "I:/Git/Tronsister/planAhead_run_1" -part xc5vlx110tff1136-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "I:/Git/Tronsister/Tronsistor32.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {I:/Git/Tronsister} {ipcore_dir} }
add_files [list {ipcore_dir/Main_Memory.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/pattern_table.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/background_pattern_table.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/background_tile_table.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/background_attribute_table.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/color_palette_rom.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/OAMB.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/OAM_RAM.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "Tronsistor32.ucf" [current_fileset -constrset]
add_files [list {Tronsistor32.ucf}] -fileset [get_property constrset [current_run]]
link_design
