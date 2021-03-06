`timescale 1ns/1ps

// Use same name for compatibility w/ gtkw save files.
module tinyfpga_soc();
reg sys_rst;
reg sys_clk;

reg rx;
wire tx;

wire mosi, miso, dummy1, dummy2;
wire cs_n, spi_clk, trigger, led0, led1, led2;

// clock
initial sys_clk = 1'b0;
always #15.625 sys_clk = ~sys_clk;

// reset
initial begin
	sys_rst = 1'b1;
	#20
	sys_rst = 1'b0;
end

// serial
initial rx = 1'b1;


`ifdef PAR
	chip dut(
		.pin_A6(sys_clk),
		.pin_F1(sys_rst),
		.pin_D4(tx),
		.pin_C5(rx)
	);
`else
	top dut(
	    .clk16(sys_clk),
	    .rst(sys_rst),
	    .serial_rx(rx),
	    .serial_tx(tx)
	);
`endif


integer j;
initial begin
    `ifdef POST_SYNTH
        $dumpfile("tinyfpga-soc-no-trigger-post-synth.vcd");
		// for(j = 0; j < 32; j = j + 1) begin
		// 	$dumpvars(0, tinyfpga_soc.dut.lm32_cpu.registers[0]);
		// end
    `else
		`ifdef PAR
			$dumpfile("tinyfpga-soc-no-trigger-par.vcd");
		`else
	        $dumpfile("tinyfpga-soc-no-trigger.vcd");
			for(j = 0; j < 32; j = j + 1) begin
				$dumpvars(0, tinyfpga_soc.dut.lm32_cpu.registers[j]);
			end
		`endif
    `endif

    $dumpvars(0, tinyfpga_soc);
end


always @ (posedge sys_clk)
begin
    if($time > 1000000) begin
        $finish;
    end
end

endmodule
