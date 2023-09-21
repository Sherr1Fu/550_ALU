transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/17.0/checkpoint1 {C:/intelFPGA_lite/17.0/checkpoint1/RCA.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/17.0/checkpoint1 {C:/intelFPGA_lite/17.0/checkpoint1/FA.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/17.0/checkpoint1 {C:/intelFPGA_lite/17.0/checkpoint1/alu.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/17.0/checkpoint1 {C:/intelFPGA_lite/17.0/checkpoint1/CSA_32bit.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/17.0/checkpoint1 {C:/intelFPGA_lite/17.0/checkpoint1/RCA_16bit.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/17.0/checkpoint1 {C:/intelFPGA_lite/17.0/checkpoint1/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
