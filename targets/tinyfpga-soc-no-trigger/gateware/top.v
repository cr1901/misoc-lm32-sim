/* Machine-generated using LiteX gen */
module top(
	output reg serial_tx,
	input serial_rx,
	input clk16,
	input rst
);

wire [29:0] ibus_adr;
wire [31:0] ibus_dat_w;
wire [31:0] ibus_dat_r;
wire [3:0] ibus_sel;
wire ibus_cyc;
wire ibus_stb;
wire ibus_ack;
wire ibus_we;
wire [2:0] ibus_cti;
wire [1:0] ibus_bte;
wire ibus_err;
wire [29:0] dbus_adr;
wire [31:0] dbus_dat_w;
wire [31:0] dbus_dat_r;
wire [3:0] dbus_sel;
wire dbus_cyc;
wire dbus_stb;
wire dbus_ack;
wire dbus_we;
wire [2:0] dbus_cti;
wire [1:0] dbus_bte;
wire dbus_err;
wire [31:0] interrupt;
wire [31:0] i_adr_o;
wire [31:0] d_adr_o;
wire [29:0] rom_bus_adr;
wire [31:0] rom_bus_dat_w;
wire [31:0] rom_bus_dat_r;
wire [3:0] rom_bus_sel;
wire rom_bus_cyc;
wire rom_bus_stb;
reg rom_bus_ack = 1'd0;
wire rom_bus_we;
wire [2:0] rom_bus_cti;
wire [1:0] rom_bus_bte;
reg rom_bus_err = 1'd0;
wire [10:0] rom_adr;
wire [31:0] rom_dat_r;
wire [29:0] sram_bus_adr;
wire [31:0] sram_bus_dat_w;
wire [31:0] sram_bus_dat_r;
wire [3:0] sram_bus_sel;
wire sram_bus_cyc;
wire sram_bus_stb;
reg sram_bus_ack = 1'd0;
wire sram_bus_we;
wire [2:0] sram_bus_cti;
wire [1:0] sram_bus_bte;
reg sram_bus_err = 1'd0;
wire [9:0] sram_adr;
wire [31:0] sram_dat_r;
reg [3:0] sram_we = 4'd0;
wire [31:0] sram_dat_w;
reg [13:0] interface_adr = 14'd0;
reg interface_we = 1'd0;
reg [7:0] interface_dat_w = 8'd0;
wire [7:0] interface_dat_r;
wire [29:0] bus_wishbone_adr;
wire [31:0] bus_wishbone_dat_w;
reg [31:0] bus_wishbone_dat_r = 32'd0;
wire [3:0] bus_wishbone_sel;
wire bus_wishbone_cyc;
wire bus_wishbone_stb;
reg bus_wishbone_ack = 1'd0;
wire bus_wishbone_we;
wire [2:0] bus_wishbone_cti;
wire [1:0] bus_wishbone_bte;
reg bus_wishbone_err = 1'd0;
reg [1:0] counter = 2'd0;
reg [31:0] uart_phy_storage_full = 32'd2576980;
wire [31:0] uart_phy_storage;
reg uart_phy_re = 1'd0;
wire uart_phy_sink_valid;
reg uart_phy_sink_ready = 1'd0;
wire uart_phy_sink_first;
wire uart_phy_sink_last;
wire [7:0] uart_phy_sink_payload_data;
reg uart_phy_uart_clk_txen = 1'd0;
reg [31:0] uart_phy_phase_accumulator_tx = 32'd0;
reg [7:0] uart_phy_tx_reg = 8'd0;
reg [3:0] uart_phy_tx_bitcount = 4'd0;
reg uart_phy_tx_busy = 1'd0;
reg uart_phy_source_valid = 1'd0;
wire uart_phy_source_ready;
reg uart_phy_source_first = 1'd0;
reg uart_phy_source_last = 1'd0;
reg [7:0] uart_phy_source_payload_data = 8'd0;
reg uart_phy_uart_clk_rxen = 1'd0;
reg [31:0] uart_phy_phase_accumulator_rx = 32'd0;
wire uart_phy_rx;
reg uart_phy_rx_r = 1'd0;
reg [7:0] uart_phy_rx_reg = 8'd0;
reg [3:0] uart_phy_rx_bitcount = 4'd0;
reg uart_phy_rx_busy = 1'd0;
wire uart_rxtx_re;
wire [7:0] uart_rxtx_r;
wire [7:0] uart_rxtx_w;
wire uart_txfull_status;
wire uart_rxempty_status;
wire uart_irq;
wire uart_tx_status;
reg uart_tx_pending = 1'd0;
wire uart_tx_trigger;
reg uart_tx_clear = 1'd0;
reg uart_tx_old_trigger = 1'd0;
wire uart_rx_status;
reg uart_rx_pending = 1'd0;
wire uart_rx_trigger;
reg uart_rx_clear = 1'd0;
reg uart_rx_old_trigger = 1'd0;
wire uart_status_re;
wire [1:0] uart_status_r;
reg [1:0] uart_status_w = 2'd0;
wire uart_pending_re;
wire [1:0] uart_pending_r;
reg [1:0] uart_pending_w = 2'd0;
reg [1:0] uart_storage_full = 2'd0;
wire [1:0] uart_storage;
reg uart_re = 1'd0;
wire uart_tx_fifo_sink_valid;
wire uart_tx_fifo_sink_ready;
reg uart_tx_fifo_sink_first = 1'd0;
reg uart_tx_fifo_sink_last = 1'd0;
wire [7:0] uart_tx_fifo_sink_payload_data;
wire uart_tx_fifo_source_valid;
wire uart_tx_fifo_source_ready;
wire uart_tx_fifo_source_first;
wire uart_tx_fifo_source_last;
wire [7:0] uart_tx_fifo_source_payload_data;
wire uart_tx_fifo_syncfifo_we;
wire uart_tx_fifo_syncfifo_writable;
wire uart_tx_fifo_syncfifo_re;
wire uart_tx_fifo_syncfifo_readable;
wire [9:0] uart_tx_fifo_syncfifo_din;
wire [9:0] uart_tx_fifo_syncfifo_dout;
reg [4:0] uart_tx_fifo_level = 5'd0;
reg uart_tx_fifo_replace = 1'd0;
reg [3:0] uart_tx_fifo_produce = 4'd0;
reg [3:0] uart_tx_fifo_consume = 4'd0;
reg [3:0] uart_tx_fifo_wrport_adr = 4'd0;
wire [9:0] uart_tx_fifo_wrport_dat_r;
wire uart_tx_fifo_wrport_we;
wire [9:0] uart_tx_fifo_wrport_dat_w;
wire uart_tx_fifo_do_read;
wire [3:0] uart_tx_fifo_rdport_adr;
wire [9:0] uart_tx_fifo_rdport_dat_r;
wire [7:0] uart_tx_fifo_fifo_in_payload_data;
wire uart_tx_fifo_fifo_in_first;
wire uart_tx_fifo_fifo_in_last;
wire [7:0] uart_tx_fifo_fifo_out_payload_data;
wire uart_tx_fifo_fifo_out_first;
wire uart_tx_fifo_fifo_out_last;
wire uart_rx_fifo_sink_valid;
wire uart_rx_fifo_sink_ready;
wire uart_rx_fifo_sink_first;
wire uart_rx_fifo_sink_last;
wire [7:0] uart_rx_fifo_sink_payload_data;
wire uart_rx_fifo_source_valid;
wire uart_rx_fifo_source_ready;
wire uart_rx_fifo_source_first;
wire uart_rx_fifo_source_last;
wire [7:0] uart_rx_fifo_source_payload_data;
wire uart_rx_fifo_syncfifo_we;
wire uart_rx_fifo_syncfifo_writable;
wire uart_rx_fifo_syncfifo_re;
wire uart_rx_fifo_syncfifo_readable;
wire [9:0] uart_rx_fifo_syncfifo_din;
wire [9:0] uart_rx_fifo_syncfifo_dout;
reg [4:0] uart_rx_fifo_level = 5'd0;
reg uart_rx_fifo_replace = 1'd0;
reg [3:0] uart_rx_fifo_produce = 4'd0;
reg [3:0] uart_rx_fifo_consume = 4'd0;
reg [3:0] uart_rx_fifo_wrport_adr = 4'd0;
wire [9:0] uart_rx_fifo_wrport_dat_r;
wire uart_rx_fifo_wrport_we;
wire [9:0] uart_rx_fifo_wrport_dat_w;
wire uart_rx_fifo_do_read;
wire [3:0] uart_rx_fifo_rdport_adr;
wire [9:0] uart_rx_fifo_rdport_dat_r;
wire [7:0] uart_rx_fifo_fifo_in_payload_data;
wire uart_rx_fifo_fifo_in_first;
wire uart_rx_fifo_fifo_in_last;
wire [7:0] uart_rx_fifo_fifo_out_payload_data;
wire uart_rx_fifo_fifo_out_first;
wire uart_rx_fifo_fifo_out_last;
wire por_clk;
wire sys_clk;
wire sys_rst;
reg [11:0] reset_delay = 12'd4095;
wire [29:0] shared_adr;
wire [31:0] shared_dat_w;
wire [31:0] shared_dat_r;
wire [3:0] shared_sel;
wire shared_cyc;
wire shared_stb;
wire shared_ack;
wire shared_we;
wire [2:0] shared_cti;
wire [1:0] shared_bte;
wire shared_err;
wire [1:0] request;
reg grant = 1'd0;
reg [2:0] slave_sel = 3'd0;
reg [2:0] slave_sel_r = 3'd0;
wire [13:0] interface0_bank_bus_adr;
wire interface0_bank_bus_we;
wire [7:0] interface0_bank_bus_dat_w;
reg [7:0] interface0_bank_bus_dat_r = 8'd0;
wire csrbank0_txfull_re;
wire csrbank0_txfull_r;
wire csrbank0_txfull_w;
wire csrbank0_rxempty_re;
wire csrbank0_rxempty_r;
wire csrbank0_rxempty_w;
wire csrbank0_ev_enable0_re;
wire [1:0] csrbank0_ev_enable0_r;
wire [1:0] csrbank0_ev_enable0_w;
wire csrbank0_sel;
wire [13:0] interface1_bank_bus_adr;
wire interface1_bank_bus_we;
wire [7:0] interface1_bank_bus_dat_w;
reg [7:0] interface1_bank_bus_dat_r = 8'd0;
wire csrbank1_tuning_word3_re;
wire [7:0] csrbank1_tuning_word3_r;
wire [7:0] csrbank1_tuning_word3_w;
wire csrbank1_tuning_word2_re;
wire [7:0] csrbank1_tuning_word2_r;
wire [7:0] csrbank1_tuning_word2_w;
wire csrbank1_tuning_word1_re;
wire [7:0] csrbank1_tuning_word1_r;
wire [7:0] csrbank1_tuning_word1_w;
wire csrbank1_tuning_word0_re;
wire [7:0] csrbank1_tuning_word0_r;
wire [7:0] csrbank1_tuning_word0_w;
wire csrbank1_sel;
reg [29:0] array_muxed0 = 30'd0;
reg [31:0] array_muxed1 = 32'd0;
reg [3:0] array_muxed2 = 4'd0;
reg array_muxed3 = 1'd0;
reg array_muxed4 = 1'd0;
reg array_muxed5 = 1'd0;
reg [2:0] array_muxed6 = 3'd0;
reg [1:0] array_muxed7 = 2'd0;
reg regs0 = 1'd0;
reg regs1 = 1'd0;

assign interrupt[2] = uart_irq;
assign ibus_adr = i_adr_o[31:2];
assign dbus_adr = d_adr_o[31:2];
assign rom_adr = rom_bus_adr[10:0];
assign rom_bus_dat_r = rom_dat_r;
always @(*) begin
	sram_we <= 4'd0;
	sram_we[0] <= (((sram_bus_cyc & sram_bus_stb) & sram_bus_we) & sram_bus_sel[0]);
	sram_we[1] <= (((sram_bus_cyc & sram_bus_stb) & sram_bus_we) & sram_bus_sel[1]);
	sram_we[2] <= (((sram_bus_cyc & sram_bus_stb) & sram_bus_we) & sram_bus_sel[2]);
	sram_we[3] <= (((sram_bus_cyc & sram_bus_stb) & sram_bus_we) & sram_bus_sel[3]);
end
assign sram_adr = sram_bus_adr[9:0];
assign sram_bus_dat_r = sram_dat_r;
assign sram_dat_w = sram_bus_dat_w;
assign uart_tx_fifo_sink_valid = uart_rxtx_re;
assign uart_tx_fifo_sink_payload_data = uart_rxtx_r;
assign uart_txfull_status = (~uart_tx_fifo_sink_ready);
assign uart_phy_sink_valid = uart_tx_fifo_source_valid;
assign uart_tx_fifo_source_ready = uart_phy_sink_ready;
assign uart_phy_sink_first = uart_tx_fifo_source_first;
assign uart_phy_sink_last = uart_tx_fifo_source_last;
assign uart_phy_sink_payload_data = uart_tx_fifo_source_payload_data;
assign uart_tx_trigger = (~uart_tx_fifo_sink_ready);
assign uart_rx_fifo_sink_valid = uart_phy_source_valid;
assign uart_phy_source_ready = uart_rx_fifo_sink_ready;
assign uart_rx_fifo_sink_first = uart_phy_source_first;
assign uart_rx_fifo_sink_last = uart_phy_source_last;
assign uart_rx_fifo_sink_payload_data = uart_phy_source_payload_data;
assign uart_rxempty_status = (~uart_rx_fifo_source_valid);
assign uart_rxtx_w = uart_rx_fifo_source_payload_data;
assign uart_rx_fifo_source_ready = uart_rx_clear;
assign uart_rx_trigger = (~uart_rx_fifo_source_valid);
always @(*) begin
	uart_tx_clear <= 1'd0;
	if ((uart_pending_re & uart_pending_r[0])) begin
		uart_tx_clear <= 1'd1;
	end
end
always @(*) begin
	uart_status_w <= 2'd0;
	uart_status_w[0] <= uart_tx_status;
	uart_status_w[1] <= uart_rx_status;
end
always @(*) begin
	uart_rx_clear <= 1'd0;
	if ((uart_pending_re & uart_pending_r[1])) begin
		uart_rx_clear <= 1'd1;
	end
end
always @(*) begin
	uart_pending_w <= 2'd0;
	uart_pending_w[0] <= uart_tx_pending;
	uart_pending_w[1] <= uart_rx_pending;
end
assign uart_irq = ((uart_pending_w[0] & uart_storage[0]) | (uart_pending_w[1] & uart_storage[1]));
assign uart_tx_status = uart_tx_trigger;
assign uart_rx_status = uart_rx_trigger;
assign uart_tx_fifo_syncfifo_din = {uart_tx_fifo_fifo_in_last, uart_tx_fifo_fifo_in_first, uart_tx_fifo_fifo_in_payload_data};
assign {uart_tx_fifo_fifo_out_last, uart_tx_fifo_fifo_out_first, uart_tx_fifo_fifo_out_payload_data} = uart_tx_fifo_syncfifo_dout;
assign uart_tx_fifo_sink_ready = uart_tx_fifo_syncfifo_writable;
assign uart_tx_fifo_syncfifo_we = uart_tx_fifo_sink_valid;
assign uart_tx_fifo_fifo_in_first = uart_tx_fifo_sink_first;
assign uart_tx_fifo_fifo_in_last = uart_tx_fifo_sink_last;
assign uart_tx_fifo_fifo_in_payload_data = uart_tx_fifo_sink_payload_data;
assign uart_tx_fifo_source_valid = uart_tx_fifo_syncfifo_readable;
assign uart_tx_fifo_source_first = uart_tx_fifo_fifo_out_first;
assign uart_tx_fifo_source_last = uart_tx_fifo_fifo_out_last;
assign uart_tx_fifo_source_payload_data = uart_tx_fifo_fifo_out_payload_data;
assign uart_tx_fifo_syncfifo_re = uart_tx_fifo_source_ready;
always @(*) begin
	uart_tx_fifo_wrport_adr <= 4'd0;
	if (uart_tx_fifo_replace) begin
		uart_tx_fifo_wrport_adr <= (uart_tx_fifo_produce - 1'd1);
	end else begin
		uart_tx_fifo_wrport_adr <= uart_tx_fifo_produce;
	end
end
assign uart_tx_fifo_wrport_dat_w = uart_tx_fifo_syncfifo_din;
assign uart_tx_fifo_wrport_we = (uart_tx_fifo_syncfifo_we & (uart_tx_fifo_syncfifo_writable | uart_tx_fifo_replace));
assign uart_tx_fifo_do_read = (uart_tx_fifo_syncfifo_readable & uart_tx_fifo_syncfifo_re);
assign uart_tx_fifo_rdport_adr = uart_tx_fifo_consume;
assign uart_tx_fifo_syncfifo_dout = uart_tx_fifo_rdport_dat_r;
assign uart_tx_fifo_syncfifo_writable = (uart_tx_fifo_level != 5'd16);
assign uart_tx_fifo_syncfifo_readable = (uart_tx_fifo_level != 1'd0);
assign uart_rx_fifo_syncfifo_din = {uart_rx_fifo_fifo_in_last, uart_rx_fifo_fifo_in_first, uart_rx_fifo_fifo_in_payload_data};
assign {uart_rx_fifo_fifo_out_last, uart_rx_fifo_fifo_out_first, uart_rx_fifo_fifo_out_payload_data} = uart_rx_fifo_syncfifo_dout;
assign uart_rx_fifo_sink_ready = uart_rx_fifo_syncfifo_writable;
assign uart_rx_fifo_syncfifo_we = uart_rx_fifo_sink_valid;
assign uart_rx_fifo_fifo_in_first = uart_rx_fifo_sink_first;
assign uart_rx_fifo_fifo_in_last = uart_rx_fifo_sink_last;
assign uart_rx_fifo_fifo_in_payload_data = uart_rx_fifo_sink_payload_data;
assign uart_rx_fifo_source_valid = uart_rx_fifo_syncfifo_readable;
assign uart_rx_fifo_source_first = uart_rx_fifo_fifo_out_first;
assign uart_rx_fifo_source_last = uart_rx_fifo_fifo_out_last;
assign uart_rx_fifo_source_payload_data = uart_rx_fifo_fifo_out_payload_data;
assign uart_rx_fifo_syncfifo_re = uart_rx_fifo_source_ready;
always @(*) begin
	uart_rx_fifo_wrport_adr <= 4'd0;
	if (uart_rx_fifo_replace) begin
		uart_rx_fifo_wrport_adr <= (uart_rx_fifo_produce - 1'd1);
	end else begin
		uart_rx_fifo_wrport_adr <= uart_rx_fifo_produce;
	end
end
assign uart_rx_fifo_wrport_dat_w = uart_rx_fifo_syncfifo_din;
assign uart_rx_fifo_wrport_we = (uart_rx_fifo_syncfifo_we & (uart_rx_fifo_syncfifo_writable | uart_rx_fifo_replace));
assign uart_rx_fifo_do_read = (uart_rx_fifo_syncfifo_readable & uart_rx_fifo_syncfifo_re);
assign uart_rx_fifo_rdport_adr = uart_rx_fifo_consume;
assign uart_rx_fifo_syncfifo_dout = uart_rx_fifo_rdport_dat_r;
assign uart_rx_fifo_syncfifo_writable = (uart_rx_fifo_level != 5'd16);
assign uart_rx_fifo_syncfifo_readable = (uart_rx_fifo_level != 1'd0);
assign por_clk = clk16;
assign sys_clk = clk16;
assign sys_rst = (reset_delay != 1'd0);
assign shared_adr = array_muxed0;
assign shared_dat_w = array_muxed1;
assign shared_sel = array_muxed2;
assign shared_cyc = array_muxed3;
assign shared_stb = array_muxed4;
assign shared_we = array_muxed5;
assign shared_cti = array_muxed6;
assign shared_bte = array_muxed7;
assign ibus_dat_r = shared_dat_r;
assign dbus_dat_r = shared_dat_r;
assign ibus_ack = (shared_ack & (grant == 1'd0));
assign dbus_ack = (shared_ack & (grant == 1'd1));
assign ibus_err = (shared_err & (grant == 1'd0));
assign dbus_err = (shared_err & (grant == 1'd1));
assign request = {dbus_cyc, ibus_cyc};
always @(*) begin
	slave_sel <= 3'd0;
	slave_sel[0] <= (shared_adr[28:26] == 1'd0);
	slave_sel[1] <= (shared_adr[28:26] == 1'd1);
	slave_sel[2] <= (shared_adr[28:26] == 3'd6);
end
assign rom_bus_adr = shared_adr;
assign rom_bus_dat_w = shared_dat_w;
assign rom_bus_sel = shared_sel;
assign rom_bus_stb = shared_stb;
assign rom_bus_we = shared_we;
assign rom_bus_cti = shared_cti;
assign rom_bus_bte = shared_bte;
assign sram_bus_adr = shared_adr;
assign sram_bus_dat_w = shared_dat_w;
assign sram_bus_sel = shared_sel;
assign sram_bus_stb = shared_stb;
assign sram_bus_we = shared_we;
assign sram_bus_cti = shared_cti;
assign sram_bus_bte = shared_bte;
assign bus_wishbone_adr = shared_adr;
assign bus_wishbone_dat_w = shared_dat_w;
assign bus_wishbone_sel = shared_sel;
assign bus_wishbone_stb = shared_stb;
assign bus_wishbone_we = shared_we;
assign bus_wishbone_cti = shared_cti;
assign bus_wishbone_bte = shared_bte;
assign rom_bus_cyc = (shared_cyc & slave_sel[0]);
assign sram_bus_cyc = (shared_cyc & slave_sel[1]);
assign bus_wishbone_cyc = (shared_cyc & slave_sel[2]);
assign shared_ack = ((rom_bus_ack | sram_bus_ack) | bus_wishbone_ack);
assign shared_err = ((rom_bus_err | sram_bus_err) | bus_wishbone_err);
assign shared_dat_r = ((({32{slave_sel_r[0]}} & rom_bus_dat_r) | ({32{slave_sel_r[1]}} & sram_bus_dat_r)) | ({32{slave_sel_r[2]}} & bus_wishbone_dat_r));
assign csrbank0_sel = (interface0_bank_bus_adr[13:9] == 2'd2);
assign uart_rxtx_r = interface0_bank_bus_dat_w[7:0];
assign uart_rxtx_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 1'd0));
assign csrbank0_txfull_r = interface0_bank_bus_dat_w[0];
assign csrbank0_txfull_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 1'd1));
assign csrbank0_rxempty_r = interface0_bank_bus_dat_w[0];
assign csrbank0_rxempty_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 2'd2));
assign uart_status_r = interface0_bank_bus_dat_w[1:0];
assign uart_status_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 2'd3));
assign uart_pending_r = interface0_bank_bus_dat_w[1:0];
assign uart_pending_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 3'd4));
assign csrbank0_ev_enable0_r = interface0_bank_bus_dat_w[1:0];
assign csrbank0_ev_enable0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 3'd5));
assign csrbank0_txfull_w = uart_txfull_status;
assign csrbank0_rxempty_w = uart_rxempty_status;
assign uart_storage = uart_storage_full[1:0];
assign csrbank0_ev_enable0_w = uart_storage_full[1:0];
assign csrbank1_sel = (interface1_bank_bus_adr[13:9] == 1'd1);
assign csrbank1_tuning_word3_r = interface1_bank_bus_dat_w[7:0];
assign csrbank1_tuning_word3_re = ((csrbank1_sel & interface1_bank_bus_we) & (interface1_bank_bus_adr[1:0] == 1'd0));
assign csrbank1_tuning_word2_r = interface1_bank_bus_dat_w[7:0];
assign csrbank1_tuning_word2_re = ((csrbank1_sel & interface1_bank_bus_we) & (interface1_bank_bus_adr[1:0] == 1'd1));
assign csrbank1_tuning_word1_r = interface1_bank_bus_dat_w[7:0];
assign csrbank1_tuning_word1_re = ((csrbank1_sel & interface1_bank_bus_we) & (interface1_bank_bus_adr[1:0] == 2'd2));
assign csrbank1_tuning_word0_r = interface1_bank_bus_dat_w[7:0];
assign csrbank1_tuning_word0_re = ((csrbank1_sel & interface1_bank_bus_we) & (interface1_bank_bus_adr[1:0] == 2'd3));
assign uart_phy_storage = uart_phy_storage_full[31:0];
assign csrbank1_tuning_word3_w = uart_phy_storage_full[31:24];
assign csrbank1_tuning_word2_w = uart_phy_storage_full[23:16];
assign csrbank1_tuning_word1_w = uart_phy_storage_full[15:8];
assign csrbank1_tuning_word0_w = uart_phy_storage_full[7:0];
assign interface0_bank_bus_adr = interface_adr;
assign interface1_bank_bus_adr = interface_adr;
assign interface0_bank_bus_we = interface_we;
assign interface1_bank_bus_we = interface_we;
assign interface0_bank_bus_dat_w = interface_dat_w;
assign interface1_bank_bus_dat_w = interface_dat_w;
assign interface_dat_r = (interface0_bank_bus_dat_r | interface1_bank_bus_dat_r);
always @(*) begin
	array_muxed0 <= 30'd0;
	case (grant)
		1'd0: begin
			array_muxed0 <= ibus_adr;
		end
		default: begin
			array_muxed0 <= dbus_adr;
		end
	endcase
end
always @(*) begin
	array_muxed1 <= 32'd0;
	case (grant)
		1'd0: begin
			array_muxed1 <= ibus_dat_w;
		end
		default: begin
			array_muxed1 <= dbus_dat_w;
		end
	endcase
end
always @(*) begin
	array_muxed2 <= 4'd0;
	case (grant)
		1'd0: begin
			array_muxed2 <= ibus_sel;
		end
		default: begin
			array_muxed2 <= dbus_sel;
		end
	endcase
end
always @(*) begin
	array_muxed3 <= 1'd0;
	case (grant)
		1'd0: begin
			array_muxed3 <= ibus_cyc;
		end
		default: begin
			array_muxed3 <= dbus_cyc;
		end
	endcase
end
always @(*) begin
	array_muxed4 <= 1'd0;
	case (grant)
		1'd0: begin
			array_muxed4 <= ibus_stb;
		end
		default: begin
			array_muxed4 <= dbus_stb;
		end
	endcase
end
always @(*) begin
	array_muxed5 <= 1'd0;
	case (grant)
		1'd0: begin
			array_muxed5 <= ibus_we;
		end
		default: begin
			array_muxed5 <= dbus_we;
		end
	endcase
end
always @(*) begin
	array_muxed6 <= 3'd0;
	case (grant)
		1'd0: begin
			array_muxed6 <= ibus_cti;
		end
		default: begin
			array_muxed6 <= dbus_cti;
		end
	endcase
end
always @(*) begin
	array_muxed7 <= 2'd0;
	case (grant)
		1'd0: begin
			array_muxed7 <= ibus_bte;
		end
		default: begin
			array_muxed7 <= dbus_bte;
		end
	endcase
end
assign uart_phy_rx = regs1;

always @(posedge por_clk) begin
	if (rst) begin
		reset_delay <= 1'd0;
	end else begin
		if ((reset_delay != 1'd0)) begin
			reset_delay <= (reset_delay - 1'd1);
		end
	end
end

always @(posedge sys_clk) begin
	rom_bus_ack <= 1'd0;
	if (((rom_bus_cyc & rom_bus_stb) & (~rom_bus_ack))) begin
		rom_bus_ack <= 1'd1;
	end
	sram_bus_ack <= 1'd0;
	if (((sram_bus_cyc & sram_bus_stb) & (~sram_bus_ack))) begin
		sram_bus_ack <= 1'd1;
	end
	interface_we <= 1'd0;
	interface_dat_w <= bus_wishbone_dat_w;
	interface_adr <= bus_wishbone_adr;
	bus_wishbone_dat_r <= interface_dat_r;
	if ((counter == 1'd1)) begin
		interface_we <= bus_wishbone_we;
	end
	if ((counter == 2'd2)) begin
		bus_wishbone_ack <= 1'd1;
	end
	if ((counter == 2'd3)) begin
		bus_wishbone_ack <= 1'd0;
	end
	if ((counter != 1'd0)) begin
		counter <= (counter + 1'd1);
	end else begin
		if ((bus_wishbone_cyc & bus_wishbone_stb)) begin
			counter <= 1'd1;
		end
	end
	uart_phy_sink_ready <= 1'd0;
	if (((uart_phy_sink_valid & (~uart_phy_tx_busy)) & (~uart_phy_sink_ready))) begin
		uart_phy_tx_reg <= uart_phy_sink_payload_data;
		uart_phy_tx_bitcount <= 1'd0;
		uart_phy_tx_busy <= 1'd1;
		serial_tx <= 1'd0;
	end else begin
		if ((uart_phy_uart_clk_txen & uart_phy_tx_busy)) begin
			uart_phy_tx_bitcount <= (uart_phy_tx_bitcount + 1'd1);
			if ((uart_phy_tx_bitcount == 4'd8)) begin
				serial_tx <= 1'd1;
			end else begin
				if ((uart_phy_tx_bitcount == 4'd9)) begin
					serial_tx <= 1'd1;
					uart_phy_tx_busy <= 1'd0;
					uart_phy_sink_ready <= 1'd1;
				end else begin
					serial_tx <= uart_phy_tx_reg[0];
					uart_phy_tx_reg <= {1'd0, uart_phy_tx_reg[7:1]};
				end
			end
		end
	end
	if (uart_phy_tx_busy) begin
		{uart_phy_uart_clk_txen, uart_phy_phase_accumulator_tx} <= (uart_phy_phase_accumulator_tx + uart_phy_storage);
	end else begin
		{uart_phy_uart_clk_txen, uart_phy_phase_accumulator_tx} <= 1'd0;
	end
	uart_phy_source_valid <= 1'd0;
	uart_phy_rx_r <= uart_phy_rx;
	if ((~uart_phy_rx_busy)) begin
		if (((~uart_phy_rx) & uart_phy_rx_r)) begin
			uart_phy_rx_busy <= 1'd1;
			uart_phy_rx_bitcount <= 1'd0;
		end
	end else begin
		if (uart_phy_uart_clk_rxen) begin
			uart_phy_rx_bitcount <= (uart_phy_rx_bitcount + 1'd1);
			if ((uart_phy_rx_bitcount == 1'd0)) begin
				if (uart_phy_rx) begin
					uart_phy_rx_busy <= 1'd0;
				end
			end else begin
				if ((uart_phy_rx_bitcount == 4'd9)) begin
					uart_phy_rx_busy <= 1'd0;
					if (uart_phy_rx) begin
						uart_phy_source_payload_data <= uart_phy_rx_reg;
						uart_phy_source_valid <= 1'd1;
					end
				end else begin
					uart_phy_rx_reg <= {uart_phy_rx, uart_phy_rx_reg[7:1]};
				end
			end
		end
	end
	if (uart_phy_rx_busy) begin
		{uart_phy_uart_clk_rxen, uart_phy_phase_accumulator_rx} <= (uart_phy_phase_accumulator_rx + uart_phy_storage);
	end else begin
		{uart_phy_uart_clk_rxen, uart_phy_phase_accumulator_rx} <= 32'd2147483648;
	end
	if (uart_tx_clear) begin
		uart_tx_pending <= 1'd0;
	end
	uart_tx_old_trigger <= uart_tx_trigger;
	if (((~uart_tx_trigger) & uart_tx_old_trigger)) begin
		uart_tx_pending <= 1'd1;
	end
	if (uart_rx_clear) begin
		uart_rx_pending <= 1'd0;
	end
	uart_rx_old_trigger <= uart_rx_trigger;
	if (((~uart_rx_trigger) & uart_rx_old_trigger)) begin
		uart_rx_pending <= 1'd1;
	end
	if (((uart_tx_fifo_syncfifo_we & uart_tx_fifo_syncfifo_writable) & (~uart_tx_fifo_replace))) begin
		uart_tx_fifo_produce <= (uart_tx_fifo_produce + 1'd1);
	end
	if (uart_tx_fifo_do_read) begin
		uart_tx_fifo_consume <= (uart_tx_fifo_consume + 1'd1);
	end
	if (((uart_tx_fifo_syncfifo_we & uart_tx_fifo_syncfifo_writable) & (~uart_tx_fifo_replace))) begin
		if ((~uart_tx_fifo_do_read)) begin
			uart_tx_fifo_level <= (uart_tx_fifo_level + 1'd1);
		end
	end else begin
		if (uart_tx_fifo_do_read) begin
			uart_tx_fifo_level <= (uart_tx_fifo_level - 1'd1);
		end
	end
	if (((uart_rx_fifo_syncfifo_we & uart_rx_fifo_syncfifo_writable) & (~uart_rx_fifo_replace))) begin
		uart_rx_fifo_produce <= (uart_rx_fifo_produce + 1'd1);
	end
	if (uart_rx_fifo_do_read) begin
		uart_rx_fifo_consume <= (uart_rx_fifo_consume + 1'd1);
	end
	if (((uart_rx_fifo_syncfifo_we & uart_rx_fifo_syncfifo_writable) & (~uart_rx_fifo_replace))) begin
		if ((~uart_rx_fifo_do_read)) begin
			uart_rx_fifo_level <= (uart_rx_fifo_level + 1'd1);
		end
	end else begin
		if (uart_rx_fifo_do_read) begin
			uart_rx_fifo_level <= (uart_rx_fifo_level - 1'd1);
		end
	end
	case (grant)
		1'd0: begin
			if ((~request[0])) begin
				if (request[1]) begin
					grant <= 1'd1;
				end
			end
		end
		1'd1: begin
			if ((~request[1])) begin
				if (request[0]) begin
					grant <= 1'd0;
				end
			end
		end
	endcase
	slave_sel_r <= slave_sel;
	interface0_bank_bus_dat_r <= 1'd0;
	if (csrbank0_sel) begin
		case (interface0_bank_bus_adr[2:0])
			1'd0: begin
				interface0_bank_bus_dat_r <= uart_rxtx_w;
			end
			1'd1: begin
				interface0_bank_bus_dat_r <= csrbank0_txfull_w;
			end
			2'd2: begin
				interface0_bank_bus_dat_r <= csrbank0_rxempty_w;
			end
			2'd3: begin
				interface0_bank_bus_dat_r <= uart_status_w;
			end
			3'd4: begin
				interface0_bank_bus_dat_r <= uart_pending_w;
			end
			3'd5: begin
				interface0_bank_bus_dat_r <= csrbank0_ev_enable0_w;
			end
		endcase
	end
	if (csrbank0_ev_enable0_re) begin
		uart_storage_full[1:0] <= csrbank0_ev_enable0_r;
	end
	uart_re <= csrbank0_ev_enable0_re;
	interface1_bank_bus_dat_r <= 1'd0;
	if (csrbank1_sel) begin
		case (interface1_bank_bus_adr[1:0])
			1'd0: begin
				interface1_bank_bus_dat_r <= csrbank1_tuning_word3_w;
			end
			1'd1: begin
				interface1_bank_bus_dat_r <= csrbank1_tuning_word2_w;
			end
			2'd2: begin
				interface1_bank_bus_dat_r <= csrbank1_tuning_word1_w;
			end
			2'd3: begin
				interface1_bank_bus_dat_r <= csrbank1_tuning_word0_w;
			end
		endcase
	end
	if (csrbank1_tuning_word3_re) begin
		uart_phy_storage_full[31:24] <= csrbank1_tuning_word3_r;
	end
	if (csrbank1_tuning_word2_re) begin
		uart_phy_storage_full[23:16] <= csrbank1_tuning_word2_r;
	end
	if (csrbank1_tuning_word1_re) begin
		uart_phy_storage_full[15:8] <= csrbank1_tuning_word1_r;
	end
	if (csrbank1_tuning_word0_re) begin
		uart_phy_storage_full[7:0] <= csrbank1_tuning_word0_r;
	end
	uart_phy_re <= csrbank1_tuning_word0_re;
	if (sys_rst) begin
		rom_bus_ack <= 1'd0;
		sram_bus_ack <= 1'd0;
		interface_adr <= 14'd0;
		interface_we <= 1'd0;
		interface_dat_w <= 8'd0;
		bus_wishbone_dat_r <= 32'd0;
		bus_wishbone_ack <= 1'd0;
		counter <= 2'd0;
		serial_tx <= 1'd1;
		uart_phy_storage_full <= 32'd2576980;
		uart_phy_re <= 1'd0;
		uart_phy_sink_ready <= 1'd0;
		uart_phy_uart_clk_txen <= 1'd0;
		uart_phy_phase_accumulator_tx <= 32'd0;
		uart_phy_tx_reg <= 8'd0;
		uart_phy_tx_bitcount <= 4'd0;
		uart_phy_tx_busy <= 1'd0;
		uart_phy_source_valid <= 1'd0;
		uart_phy_source_payload_data <= 8'd0;
		uart_phy_uart_clk_rxen <= 1'd0;
		uart_phy_phase_accumulator_rx <= 32'd0;
		uart_phy_rx_r <= 1'd0;
		uart_phy_rx_reg <= 8'd0;
		uart_phy_rx_bitcount <= 4'd0;
		uart_phy_rx_busy <= 1'd0;
		uart_tx_pending <= 1'd0;
		uart_tx_old_trigger <= 1'd0;
		uart_rx_pending <= 1'd0;
		uart_rx_old_trigger <= 1'd0;
		uart_storage_full <= 2'd0;
		uart_re <= 1'd0;
		uart_tx_fifo_level <= 5'd0;
		uart_tx_fifo_produce <= 4'd0;
		uart_tx_fifo_consume <= 4'd0;
		uart_rx_fifo_level <= 5'd0;
		uart_rx_fifo_produce <= 4'd0;
		uart_rx_fifo_consume <= 4'd0;
		grant <= 1'd0;
		slave_sel_r <= 3'd0;
		interface0_bank_bus_dat_r <= 8'd0;
		interface1_bank_bus_dat_r <= 8'd0;
	end
	regs0 <= serial_rx;
	regs1 <= regs0;
end

lm32_cpu #(
	.eba_reset(32'h00000000)
) lm32_cpu (
	.D_ACK_I(dbus_ack),
	.D_DAT_I(dbus_dat_r),
	.D_ERR_I(dbus_err),
	.D_RTY_I(1'd0),
	.I_ACK_I(ibus_ack),
	.I_DAT_I(ibus_dat_r),
	.I_ERR_I(ibus_err),
	.I_RTY_I(1'd0),
	.clk_i(sys_clk),
	.interrupt(interrupt),
	.rst_i(sys_rst),
	.D_ADR_O(d_adr_o),
	.D_BTE_O(dbus_bte),
	.D_CTI_O(dbus_cti),
	.D_CYC_O(dbus_cyc),
	.D_DAT_O(dbus_dat_w),
	.D_SEL_O(dbus_sel),
	.D_STB_O(dbus_stb),
	.D_WE_O(dbus_we),
	.I_ADR_O(i_adr_o),
	.I_BTE_O(ibus_bte),
	.I_CTI_O(ibus_cti),
	.I_CYC_O(ibus_cyc),
	.I_DAT_O(ibus_dat_w),
	.I_SEL_O(ibus_sel),
	.I_STB_O(ibus_stb),
	.I_WE_O(ibus_we)
);

reg [31:0] mem[0:2047];
reg [10:0] memadr;
always @(posedge sys_clk) begin
	memadr <= rom_adr;
end

assign rom_dat_r = mem[memadr];

initial begin
	$readmemh("mem.init", mem);
end

reg [31:0] mem_1[0:1023];
reg [9:0] memadr_1;
always @(posedge sys_clk) begin
	if (sram_we[0])
		mem_1[sram_adr][7:0] <= sram_dat_w[7:0];
	if (sram_we[1])
		mem_1[sram_adr][15:8] <= sram_dat_w[15:8];
	if (sram_we[2])
		mem_1[sram_adr][23:16] <= sram_dat_w[23:16];
	if (sram_we[3])
		mem_1[sram_adr][31:24] <= sram_dat_w[31:24];
	memadr_1 <= sram_adr;
end

assign sram_dat_r = mem_1[memadr_1];

reg [9:0] storage[0:15];
reg [9:0] memdat;
always @(posedge sys_clk) begin
	if (uart_tx_fifo_wrport_we)
		storage[uart_tx_fifo_wrport_adr] <= uart_tx_fifo_wrport_dat_w;
	memdat <= storage[uart_tx_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
end

assign uart_tx_fifo_wrport_dat_r = memdat;
assign uart_tx_fifo_rdport_dat_r = storage[uart_tx_fifo_rdport_adr];

reg [9:0] storage_1[0:15];
reg [9:0] memdat_1;
always @(posedge sys_clk) begin
	if (uart_rx_fifo_wrport_we)
		storage_1[uart_rx_fifo_wrport_adr] <= uart_rx_fifo_wrport_dat_w;
	memdat_1 <= storage_1[uart_rx_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
end

assign uart_rx_fifo_wrport_dat_r = memdat_1;
assign uart_rx_fifo_rdport_dat_r = storage_1[uart_rx_fifo_rdport_adr];

endmodule
