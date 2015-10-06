`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:04 08/13/2015 
// Design Name: 
// Module Name:    freq_div 
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
module frequency_divider(
	clk_cnt,
	clk_scn,
	clk,
	rst_n
);

	output clk_cnt;
	output [1:0] clk_scn;
	input clk;
	input rst_n;

	reg clk_cnt;
	reg [1:0] clk_scn;
	reg [14:0] cnt_l;
	reg [6:0] cnt_h;
	reg [`FREQ_DIV_BIT-1:0] cnt_tmp;

// Combinational block 
always @*
	cnt_tmp = {clk_cnt,cnt_h,clk_scn,cnt_l} + 1'b1;
	
// Sequential block 
always @(posedge clk or negedge rst_n)
	if (~rst_n)
		{clk_cnt,cnt_h,clk_scn,cnt_l} <= `FREQ_DIV_BIT'b0;
	else
		{clk_cnt,cnt_h,clk_scn,cnt_l} <= cnt_tmp;

endmodule
