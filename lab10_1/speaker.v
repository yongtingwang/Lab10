`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    16:32 05/14/2015 
// Module Name:    speaker 
//////////////////////////////////////////////////////////////////////////////////
module speaker(
	clk,
	pb_in_rst,
	audio_appsel,
	audio_sysclk,
	audio_bck,
	audio_ws,
	audio_data
);

	input clk;
	wire clk_cnt;
	input pb_in_rst;
	wire rst;
	assign rst = ~pb_in_rst;

	wire [15:0] audio_in_left, audio_in_right;
	wire [19:0] note_data;
	output audio_appsel;
	output audio_sysclk;
	output audio_bck;
	output audio_ws;
	output audio_data;

	// Clock Process
	frequency_divider fteq_div(
		.clk_cnt(clk_cnt),
		.clk_scn(),
		.clk(clk),
		.rst(rst)
	);

	// Key and Volume Setting
	sound_setting voice_set(
		.clk(clk),
		.clk_cnt(clk_cnt),
		.rst(rst),
		.note_data(note_data)
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
endmodule
