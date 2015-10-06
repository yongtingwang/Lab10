`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:47 09/22/2015 
// Design Name: 
// Module Name:    pick 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module pick(
	clk_out,
	rst_n,
	note_data
    );
	 
input clk_out,rst_n;
output reg[19:0]note_data;
reg [19:0]note_choose;

always@*
begin
		if(note_choose[0])			// L La
			note_data = 20'd90909;
		else if(note_choose[1])		// L Si
			note_data = 20'd81633;
		else if(note_choose[2])		// M Do
			note_data = 20'd76628;
		else if(note_choose[3])		// M Re
			note_data = 20'd68259;
		else if(note_choose[4])		// M Mi
			note_data = 20'd60606;
		else if(note_choose[5])		// M Fa
			note_data = 20'd57307;
		else if(note_choose[6])		// M Sol
			note_data = 20'd51020;
		else if(note_choose[7])		// M La
			note_data = 20'd45455;
		else if(note_choose[8])		// M Si
			note_data = 20'd40486;
		else if(note_choose[9])		// H Do
			note_data = 20'd38168;
		else if(note_choose[10])	// H Re
			note_data = 20'd34014;
		else if(note_choose[11])	// H Mi
			note_data = 20'd30303;
		else if(note_choose[12])	// H Fa
			note_data = 20'd28653;
		else if(note_choose[13])	// H Sol
			note_data = 20'd25510;
		else if(note_choose[14])	// H La
			note_data = 20'd22727;
		else if(note_choose[15])	// H Si
			note_data = 20'd20243;
		else
			note_data = 20'd0;
	end
	
	// Note Choose Shifter
	always @(posedge clk_out or negedge rst_n) begin
		if (~rst_n)
		begin
			note_choose[0]<=1;
			note_choose[15:1]<=15'b000000000000000;
		end
		else 
		begin          //shifter
 			note_choose[1]<=note_choose[0];
			note_choose[2]<=note_choose[1];
			note_choose[3]<=note_choose[2];
			note_choose[4]<=note_choose[3];
			note_choose[5]<=note_choose[4];
			note_choose[6]<=note_choose[5];
			note_choose[7]<=note_choose[6];
			note_choose[8]<=note_choose[7];
			note_choose[9]<=note_choose[8];
			note_choose[10]<=note_choose[9];
			note_choose[11]<=note_choose[10];
			note_choose[12]<=note_choose[11];
			note_choose[13]<=note_choose[12];
			note_choose[14]<=note_choose[13];
			note_choose[15]<=note_choose[14];
			note_choose[0]<=note_choose[15];
		end
	end
endmodule
