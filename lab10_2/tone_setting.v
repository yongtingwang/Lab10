`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    16:20 05/19/2015 
// Module Name:    tone_setting 
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module tone_setting(
	clk,
	rst,
	key,
	pressed,
	note_data,
	note_disp   //14段顯示器顯示值
);

	input clk;
	input rst;
	input [3:0] key;
	input pressed;
	output reg [19:0] note_data;
	output reg [11:0] note_disp;
	reg [15:0] note_choose;


	// Note Control
	always @*
	begin
		if(pressed && key==`KEY_A)			// L La
		begin
			note_data = 20'd90909;
			note_disp = {`FONT_L, `FONT_A};
		end
		else if(pressed && key==`KEY_0)		// L Si
		begin
			note_data = 20'd81633;
			note_disp = {`FONT_S, `FONT_I};
		end
		else if(pressed && key==`KEY_1)		// M Do
		begin
			note_data = 20'd76628;
			note_disp = {`FONT_D, `FONT_O};
		end
		else if(pressed && key==`KEY_2)		// M Re
		begin
			note_data = 20'd68259;
			note_disp = {`FONT_R, `FONT_E};
		end
		else if(pressed && key==`KEY_3)		// M Mi
		begin
			note_data = 20'd60606;
			note_disp = {`FONT_M, `FONT_I};
		end
		else if(pressed && key==`KEY_4)		// M Fa
		begin
			note_data = 20'd57307;
			note_disp = {`FONT_F, `FONT_A};
		end
		else if(pressed && key==`KEY_5)		// M Sol
		begin
			note_data = 20'd51020;
			note_disp = {`FONT_S, `FONT_O};
		end
		else if(pressed && key==`KEY_6)		// M La
		begin
			note_data = 20'd45455;
			note_disp = {`FONT_L, `FONT_A};
		end
		else if(pressed && key==`KEY_7)		// M Si
		begin
			note_data = 20'd40486;
			note_disp = {`FONT_S, `FONT_I};
		end
		else if(pressed && key==`KEY_8)		// H Do
		begin
			note_data = 20'd38168;
			note_disp = {`FONT_D, `FONT_O};
		end
		else if(pressed && key==`KEY_9)	// H Re
		begin
			note_data = 20'd34014;
			note_disp = {`FONT_R, `FONT_E};
		end
		else if(pressed && key==`KEY_B)	// H Mi
		begin
			note_data = 20'd30303;
			note_disp = {`FONT_M, `FONT_I};
		end
		else if(pressed && key==`KEY_C)	// H Fa
		begin
			note_data = 20'd28653;
			note_disp = {`FONT_F, `FONT_A};
		end
		else if(pressed && key==`KEY_D)	// H Sol
		begin
			note_data = 20'd25510;
			note_disp = {`FONT_S, `FONT_O};
		end
		else if(pressed && key==`KEY_E)	// H La
		begin
			note_data = 20'd22727;
			note_disp = {`FONT_L, `FONT_A};
		end
		else if(pressed && key==`KEY_F)	// H Si
		begin
			note_data = 20'd20243;
			note_disp = {`FONT_S, `FONT_I};
		end
		else
		begin
			note_data = 20'd0;
			note_disp = {`FONT_ZERO, `FONT_ZERO};
		end
	end
endmodule
