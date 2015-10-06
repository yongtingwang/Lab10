`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    16:32 05/14/2015 
// Module Name:    speaker 
//////////////////////////////////////////////////////////////////////////////////
module speaker(
	clk,
	pb_in_rst,
	col_in,
	row_scn,
	audio_appsel,
	audio_sysclk,
	audio_bck,
	audio_ws,
	audio_data,
	display
);
	// Clocks and basic control
	input clk;
	wire clk_cnt;
	wire [1:0] clk_scn;
	input pb_in_rst;
	wire rst;
	assign rst = ~pb_in_rst;

	// Keypad 
	input [3:0] col_in;
	output [3:0] row_scn;
	wire [3:0] key;
	wire pressed;

	// Audio Setting
	wire [15:0] audio_in_left, audio_in_right;
	wire [19:0] note_data;
	output audio_appsel;
	output audio_sysclk;
	output audio_bck;
	output audio_ws;
	output audio_data;

	// Display
	wire [11:0] note_disp;   //14段顯示器顯示值
	wire [14:0] dispA, dispB;
	output [18:0] display;

	// Clock Process
	frequency_divider fteq_div(
		.clk_cnt(clk_cnt),
		.clk_scn(clk_scn),
		.clk(clk),
		.rst(rst)
	);

	// Keypad Scanner
	keypad_scan pad_scn(
		.clk(clk),
		.rst(rst),
		.row_scn(row_scn),
		.col_in(col_in),
		.key(key),
		.pressed(pressed)
	);

	// Tone Setting
	tone_setting tone_set(
		.clk(clk),
		.rst(rst),
		.key(key),
		.pressed(pressed),
		.note_data(note_data),
		.note_disp(note_disp)
	);

	// Tone Generator
	buzzer_control buz_ctl(
		.clk(clk),
		.rst(rst),
		.note_div(note_data),
		.vol_data({16'h4000,16'h3FFF}),
		.audio_left(audio_in_left),
		.audio_right(audio_in_right)
	);

	// DAC Signal Generator
	speaker_control spk_ctl(
		.clk(clk),
		.rst(rst),
		.audio_in_left(audio_in_left),
		.audio_in_right(audio_in_right),
		.audio_appsel(audio_appsel),
		.audio_sysclk(audio_sysclk),
		.audio_bck(audio_bck),
		.audio_ws(audio_ws),
		.audio_data(audio_data)
	);

	// Display
	FTSD_decoder ftsd_dec_A(
		.bcd(note_disp[5:0]),
		.ftsd(dispB)
	);

	FTSD_decoder ftsd_dec_B(
		.bcd(note_disp[11:6]),
		.ftsd(dispA)
	);

	FTSD_scan ftsd_scn(
		.in1(15'd0),
		.in2(15'd0),
		.in3(dispA),
		.in4(dispB),
		.clk(clk_scn),
		.display(display)
	);
endmodule
