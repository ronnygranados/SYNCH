all:
	iverilog -o synch tb_synch.v
	vvp synch
	gtkwave synch.vcd
	rm synch synch.vcd