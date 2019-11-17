//-----------------------------------------------------------------------------
// Title       : filter (top level)
//-----------------------------------------------------------------------------
// File        : filter.sv
// Company     : INP SB RAS
// Created     : 03/10/2019
// Created by  : Epshteyn Leonid
//-----------------------------------------------------------------------------
// Description : filter
//-----------------------------------------------------------------------------
// Revision    : 2.0
//-----------------------------------------------------------------------------
// Copyright (c) 2018 BINP SB RAS
// This work may not be copied, modified, re-published, uploaded, executed, or
// distributed in any way, in any medium, whether in whole or in part, without
// prior written permission from INP SB RAS.
//-----------------------------------------------------------------------------
// list of modules
//-----------------------------------------------------------------------------
/*  exp_sig_gen:
 *  	ram_exp_sig_gen,
 *  	rom_exp_sig_gen*/
//-----------------------------------------------------------------------------
import package_settings::*;
//-----------------------------------------------------------------------------
module filter (
//-----------------------------------------------------------------------------
// Input Ports
//-----------------------------------------------------------------------------
	input  wire												reset,
	input  wire												clk,
//-----------------------------------------------------------------------------
	input  wire												test_overlay,
	input  wire												test_rate,
	input  wire [SIZE_DELAY-1:0]							test_delay,
//-----------------------------------------------------------------------------
// Output Ports
//-----------------------------------------------------------------------------
	output wire [SIZE_ADC_DATA-1:0]							output_data,
//-----------------------------------------------------------------------------
	output wire [SIZE_ADC_DATA-1:0]							output_data_exp_sig_gen,
//-----------------------------------------------------------------------------
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v1,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v2,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v3,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v4,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v5,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v6,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v7,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v8,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v9,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v10,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v11,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v12,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v13,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v14,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v15,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v16,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v17,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v18,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v19,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v20,
	output wire [SIZE_FILTER_DATA-1:0]						output_data_v21);
//-----------------------------------------------------------------------------
// Signal declarations
//-----------------------------------------------------------------------------
// ExpSigGen
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Signal Section
//-----------------------------------------------------------------------------
	assign output_data										= output_data_exp_sig_gen;
//-----------------------------------------------------------------------------
// Sub Module Section
//-----------------------------------------------------------------------------
	exp_sig_gen ExpSigGen (
		.clk												(clk),
		.reset												(reset),
		.overlay											(test_overlay),
		.rate												(test_rate),
		.delay												(test_delay),
		.output_data										(output_data_exp_sig_gen));
                            
	v1_filter FilterV1 ( 
		.clk                                                  (clk),   
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v1));

	v2_filter FilterV2 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v2));
/*
	v3_filter FilterV3 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v3));

	v4_filter FilterV4 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v4));
		

	v5_filter FilterV5 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v5));

	v6_filter FilterV6 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v6));

	v7_filter FilterV7 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v7));

	v8_filter FilterV8 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v8));

	v9_filter FilterV9 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v9));
*/	
	v10_filter FilterV10 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v10));
	

	v11_filter FilterV11 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v11));

	v12_filter FilterV12 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v12));

	v13_filter FilterV13 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v13));
/*
	v14_filter FilterV14 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v14));
		
*/
	v15_filter FilterV15 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v15));
/*
	v16_filter FilterV16 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v16));
*/
	v17_filter FilterV17 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v17));
/*
	v18_filter FilterV18 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v18));

	v19_filter FilterV19 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v19));

	v20_filter FilterV20 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v20));
		
	v21_filter FilterV21 (
		.clk                                                  (clk),
		.reset                                                (reset),
		.input_data                                           (output_data_exp_sig_gen),
		.output_data                                          (output_data_v21));

*/

//-----------------------------------------------------------------------------
endmodule
