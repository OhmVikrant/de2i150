// onchip_ver_qsys.v

// Generated using ACDS version 13.0sp1 232 at 2014.11.05.17:16:40

`timescale 1 ps / 1 ps
module onchip_ver_qsys (
		input  wire        clk_clk,                             //                  clk.clk
		input  wire        reset_reset_n,                       //                reset.reset_n
		input  wire        write_master_control_fixed_location, // write_master_control.fixed_location
		input  wire [25:0] write_master_control_write_base,     //                     .write_base
		input  wire [25:0] write_master_control_write_length,   //                     .write_length
		input  wire        write_master_control_go,             //                     .go
		output wire        write_master_control_done,           //                     .done
		input  wire        write_master_user_write_buffer,      //    write_master_user.write_buffer
		input  wire [31:0] write_master_user_buffer_input_data, //                     .buffer_input_data
		output wire        write_master_user_buffer_full,       //                     .buffer_full
		input  wire        read_master_control_fixed_location,  //  read_master_control.fixed_location
		input  wire [25:0] read_master_control_read_base,       //                     .read_base
		input  wire [25:0] read_master_control_read_length,     //                     .read_length
		input  wire        read_master_control_go,              //                     .go
		output wire        read_master_control_done,            //                     .done
		output wire        read_master_control_early_done,      //                     .early_done
		input  wire        read_master_user_read_buffer,        //     read_master_user.read_buffer
		output wire [31:0] read_master_user_buffer_output_data, //                     .buffer_output_data
		output wire        read_master_user_data_available      //                     .data_available
	);

	wire         read_master_avalon_master_waitrequest;                                        // read_master_avalon_master_translator:av_waitrequest -> read_master:master_waitrequest
	wire  [25:0] read_master_avalon_master_address;                                            // read_master:master_address -> read_master_avalon_master_translator:av_address
	wire         read_master_avalon_master_read;                                               // read_master:master_read -> read_master_avalon_master_translator:av_read
	wire  [31:0] read_master_avalon_master_readdata;                                           // read_master_avalon_master_translator:av_readdata -> read_master:master_readdata
	wire         read_master_avalon_master_readdatavalid;                                      // read_master_avalon_master_translator:av_readdatavalid -> read_master:master_readdatavalid
	wire   [3:0] read_master_avalon_master_byteenable;                                         // read_master:master_byteenable -> read_master_avalon_master_translator:av_byteenable
	wire         read_master_avalon_master_translator_avalon_universal_master_0_waitrequest;   // onchip_memory2_0_s1_translator:uav_waitrequest -> read_master_avalon_master_translator:uav_waitrequest
	wire   [2:0] read_master_avalon_master_translator_avalon_universal_master_0_burstcount;    // read_master_avalon_master_translator:uav_burstcount -> onchip_memory2_0_s1_translator:uav_burstcount
	wire  [31:0] read_master_avalon_master_translator_avalon_universal_master_0_writedata;     // read_master_avalon_master_translator:uav_writedata -> onchip_memory2_0_s1_translator:uav_writedata
	wire  [25:0] read_master_avalon_master_translator_avalon_universal_master_0_address;       // read_master_avalon_master_translator:uav_address -> onchip_memory2_0_s1_translator:uav_address
	wire         read_master_avalon_master_translator_avalon_universal_master_0_lock;          // read_master_avalon_master_translator:uav_lock -> onchip_memory2_0_s1_translator:uav_lock
	wire         read_master_avalon_master_translator_avalon_universal_master_0_write;         // read_master_avalon_master_translator:uav_write -> onchip_memory2_0_s1_translator:uav_write
	wire         read_master_avalon_master_translator_avalon_universal_master_0_read;          // read_master_avalon_master_translator:uav_read -> onchip_memory2_0_s1_translator:uav_read
	wire  [31:0] read_master_avalon_master_translator_avalon_universal_master_0_readdata;      // onchip_memory2_0_s1_translator:uav_readdata -> read_master_avalon_master_translator:uav_readdata
	wire         read_master_avalon_master_translator_avalon_universal_master_0_debugaccess;   // read_master_avalon_master_translator:uav_debugaccess -> onchip_memory2_0_s1_translator:uav_debugaccess
	wire   [3:0] read_master_avalon_master_translator_avalon_universal_master_0_byteenable;    // read_master_avalon_master_translator:uav_byteenable -> onchip_memory2_0_s1_translator:uav_byteenable
	wire         read_master_avalon_master_translator_avalon_universal_master_0_readdatavalid; // onchip_memory2_0_s1_translator:uav_readdatavalid -> read_master_avalon_master_translator:uav_readdatavalid
	wire  [31:0] onchip_memory2_0_s1_translator_avalon_anti_slave_0_writedata;                 // onchip_memory2_0_s1_translator:av_writedata -> onchip_memory2_0:writedata
	wire   [5:0] onchip_memory2_0_s1_translator_avalon_anti_slave_0_address;                   // onchip_memory2_0_s1_translator:av_address -> onchip_memory2_0:address
	wire         onchip_memory2_0_s1_translator_avalon_anti_slave_0_chipselect;                // onchip_memory2_0_s1_translator:av_chipselect -> onchip_memory2_0:chipselect
	wire         onchip_memory2_0_s1_translator_avalon_anti_slave_0_clken;                     // onchip_memory2_0_s1_translator:av_clken -> onchip_memory2_0:clken
	wire         onchip_memory2_0_s1_translator_avalon_anti_slave_0_write;                     // onchip_memory2_0_s1_translator:av_write -> onchip_memory2_0:write
	wire  [31:0] onchip_memory2_0_s1_translator_avalon_anti_slave_0_readdata;                  // onchip_memory2_0:readdata -> onchip_memory2_0_s1_translator:av_readdata
	wire   [3:0] onchip_memory2_0_s1_translator_avalon_anti_slave_0_byteenable;                // onchip_memory2_0_s1_translator:av_byteenable -> onchip_memory2_0:byteenable
	wire         rst_controller_reset_out_reset;                                               // rst_controller:reset_out -> [onchip_memory2_0:reset, onchip_memory2_0_s1_translator:reset, read_master:reset, read_master_avalon_master_translator:reset, write_master:reset]
	wire         rst_controller_reset_out_reset_req;                                           // rst_controller:reset_req -> onchip_memory2_0:reset_req

	custom_master #(
		.MASTER_DIRECTION    (1),
		.DATA_WIDTH          (32),
		.ADDRESS_WIDTH       (26),
		.BURST_CAPABLE       (0),
		.MAXIMUM_BURST_COUNT (2),
		.BURST_COUNT_WIDTH   (2),
		.FIFO_DEPTH          (16),
		.FIFO_DEPTH_LOG2     (4),
		.MEMORY_BASED_FIFO   (1)
	) write_master (
		.clk                     (clk_clk),                              //       clock_reset.clk
		.reset                   (rst_controller_reset_out_reset),       // clock_reset_reset.reset
		.master_address          (),                                     //     avalon_master.address
		.master_write            (),                                     //                  .write
		.master_byteenable       (),                                     //                  .byteenable
		.master_writedata        (),                                     //                  .writedata
		.master_waitrequest      (),                                     //                  .waitrequest
		.control_fixed_location  (write_master_control_fixed_location),  //           control.export
		.control_write_base      (write_master_control_write_base),      //                  .export
		.control_write_length    (write_master_control_write_length),    //                  .export
		.control_go              (write_master_control_go),              //                  .export
		.control_done            (write_master_control_done),            //                  .export
		.user_write_buffer       (write_master_user_write_buffer),       //              user.export
		.user_buffer_input_data  (write_master_user_buffer_input_data),  //                  .export
		.user_buffer_full        (write_master_user_buffer_full),        //                  .export
		.master_read             (),                                     //       (terminated)
		.master_readdata         (32'b00000000000000000000000000000000), //       (terminated)
		.master_readdatavalid    (1'b0),                                 //       (terminated)
		.master_burstcount       (),                                     //       (terminated)
		.control_read_base       (26'b00000000000000000000000000),       //       (terminated)
		.control_read_length     (26'b00000000000000000000000000),       //       (terminated)
		.control_early_done      (),                                     //       (terminated)
		.user_read_buffer        (1'b0),                                 //       (terminated)
		.user_buffer_output_data (),                                     //       (terminated)
		.user_data_available     ()                                      //       (terminated)
	);

	custom_master #(
		.MASTER_DIRECTION    (0),
		.DATA_WIDTH          (32),
		.ADDRESS_WIDTH       (26),
		.BURST_CAPABLE       (0),
		.MAXIMUM_BURST_COUNT (2),
		.BURST_COUNT_WIDTH   (2),
		.FIFO_DEPTH          (32),
		.FIFO_DEPTH_LOG2     (5),
		.MEMORY_BASED_FIFO   (1)
	) read_master (
		.clk                     (clk_clk),                                 //       clock_reset.clk
		.reset                   (rst_controller_reset_out_reset),          // clock_reset_reset.reset
		.master_address          (read_master_avalon_master_address),       //     avalon_master.address
		.master_read             (read_master_avalon_master_read),          //                  .read
		.master_byteenable       (read_master_avalon_master_byteenable),    //                  .byteenable
		.master_readdata         (read_master_avalon_master_readdata),      //                  .readdata
		.master_readdatavalid    (read_master_avalon_master_readdatavalid), //                  .readdatavalid
		.master_waitrequest      (read_master_avalon_master_waitrequest),   //                  .waitrequest
		.control_fixed_location  (read_master_control_fixed_location),      //           control.export
		.control_read_base       (read_master_control_read_base),           //                  .export
		.control_read_length     (read_master_control_read_length),         //                  .export
		.control_go              (read_master_control_go),                  //                  .export
		.control_done            (read_master_control_done),                //                  .export
		.control_early_done      (read_master_control_early_done),          //                  .export
		.user_read_buffer        (read_master_user_read_buffer),            //              user.export
		.user_buffer_output_data (read_master_user_buffer_output_data),     //                  .export
		.user_data_available     (read_master_user_data_available),         //                  .export
		.master_write            (),                                        //       (terminated)
		.master_writedata        (),                                        //       (terminated)
		.master_burstcount       (),                                        //       (terminated)
		.control_write_base      (26'b00000000000000000000000000),          //       (terminated)
		.control_write_length    (26'b00000000000000000000000000),          //       (terminated)
		.user_write_buffer       (1'b0),                                    //       (terminated)
		.user_buffer_input_data  (32'b00000000000000000000000000000000),    //       (terminated)
		.user_buffer_full        ()                                         //       (terminated)
	);

	onchip_ver_qsys_onchip_memory2_0 onchip_memory2_0 (
		.clk        (clk_clk),                                                       //   clk1.clk
		.address    (onchip_memory2_0_s1_translator_avalon_anti_slave_0_address),    //     s1.address
		.clken      (onchip_memory2_0_s1_translator_avalon_anti_slave_0_clken),      //       .clken
		.chipselect (onchip_memory2_0_s1_translator_avalon_anti_slave_0_chipselect), //       .chipselect
		.write      (onchip_memory2_0_s1_translator_avalon_anti_slave_0_write),      //       .write
		.readdata   (onchip_memory2_0_s1_translator_avalon_anti_slave_0_readdata),   //       .readdata
		.writedata  (onchip_memory2_0_s1_translator_avalon_anti_slave_0_writedata),  //       .writedata
		.byteenable (onchip_memory2_0_s1_translator_avalon_anti_slave_0_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),                                // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req)                             //       .reset_req
	);

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (26),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (26),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (0),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (0),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.USE_READRESPONSE            (0),
		.USE_WRITERESPONSE           (0),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) read_master_avalon_master_translator (
		.clk                      (clk_clk),                                                                      //                       clk.clk
		.reset                    (rst_controller_reset_out_reset),                                               //                     reset.reset
		.uav_address              (read_master_avalon_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount           (read_master_avalon_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read                 (read_master_avalon_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write                (read_master_avalon_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest          (read_master_avalon_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid        (read_master_avalon_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable           (read_master_avalon_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata             (read_master_avalon_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata            (read_master_avalon_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock                 (read_master_avalon_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess          (read_master_avalon_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address               (read_master_avalon_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest           (read_master_avalon_master_waitrequest),                                        //                          .waitrequest
		.av_byteenable            (read_master_avalon_master_byteenable),                                         //                          .byteenable
		.av_read                  (read_master_avalon_master_read),                                               //                          .read
		.av_readdata              (read_master_avalon_master_readdata),                                           //                          .readdata
		.av_readdatavalid         (read_master_avalon_master_readdatavalid),                                      //                          .readdatavalid
		.av_burstcount            (1'b1),                                                                         //               (terminated)
		.av_beginbursttransfer    (1'b0),                                                                         //               (terminated)
		.av_begintransfer         (1'b0),                                                                         //               (terminated)
		.av_chipselect            (1'b0),                                                                         //               (terminated)
		.av_write                 (1'b0),                                                                         //               (terminated)
		.av_writedata             (32'b00000000000000000000000000000000),                                         //               (terminated)
		.av_lock                  (1'b0),                                                                         //               (terminated)
		.av_debugaccess           (1'b0),                                                                         //               (terminated)
		.uav_clken                (),                                                                             //               (terminated)
		.av_clken                 (1'b1),                                                                         //               (terminated)
		.uav_response             (2'b00),                                                                        //               (terminated)
		.av_response              (),                                                                             //               (terminated)
		.uav_writeresponserequest (),                                                                             //               (terminated)
		.uav_writeresponsevalid   (1'b0),                                                                         //               (terminated)
		.av_writeresponserequest  (1'b0),                                                                         //               (terminated)
		.av_writeresponsevalid    ()                                                                              //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (6),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (26),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (2),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.USE_READRESPONSE               (0),
		.USE_WRITERESPONSE              (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (0),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) onchip_memory2_0_s1_translator (
		.clk                      (clk_clk),                                                                      //                      clk.clk
		.reset                    (rst_controller_reset_out_reset),                                               //                    reset.reset
		.uav_address              (read_master_avalon_master_translator_avalon_universal_master_0_address),       // avalon_universal_slave_0.address
		.uav_burstcount           (read_master_avalon_master_translator_avalon_universal_master_0_burstcount),    //                         .burstcount
		.uav_read                 (read_master_avalon_master_translator_avalon_universal_master_0_read),          //                         .read
		.uav_write                (read_master_avalon_master_translator_avalon_universal_master_0_write),         //                         .write
		.uav_waitrequest          (read_master_avalon_master_translator_avalon_universal_master_0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid        (read_master_avalon_master_translator_avalon_universal_master_0_readdatavalid), //                         .readdatavalid
		.uav_byteenable           (read_master_avalon_master_translator_avalon_universal_master_0_byteenable),    //                         .byteenable
		.uav_readdata             (read_master_avalon_master_translator_avalon_universal_master_0_readdata),      //                         .readdata
		.uav_writedata            (read_master_avalon_master_translator_avalon_universal_master_0_writedata),     //                         .writedata
		.uav_lock                 (read_master_avalon_master_translator_avalon_universal_master_0_lock),          //                         .lock
		.uav_debugaccess          (read_master_avalon_master_translator_avalon_universal_master_0_debugaccess),   //                         .debugaccess
		.av_address               (onchip_memory2_0_s1_translator_avalon_anti_slave_0_address),                   //      avalon_anti_slave_0.address
		.av_write                 (onchip_memory2_0_s1_translator_avalon_anti_slave_0_write),                     //                         .write
		.av_readdata              (onchip_memory2_0_s1_translator_avalon_anti_slave_0_readdata),                  //                         .readdata
		.av_writedata             (onchip_memory2_0_s1_translator_avalon_anti_slave_0_writedata),                 //                         .writedata
		.av_byteenable            (onchip_memory2_0_s1_translator_avalon_anti_slave_0_byteenable),                //                         .byteenable
		.av_chipselect            (onchip_memory2_0_s1_translator_avalon_anti_slave_0_chipselect),                //                         .chipselect
		.av_clken                 (onchip_memory2_0_s1_translator_avalon_anti_slave_0_clken),                     //                         .clken
		.av_read                  (),                                                                             //              (terminated)
		.av_begintransfer         (),                                                                             //              (terminated)
		.av_beginbursttransfer    (),                                                                             //              (terminated)
		.av_burstcount            (),                                                                             //              (terminated)
		.av_readdatavalid         (1'b0),                                                                         //              (terminated)
		.av_waitrequest           (1'b0),                                                                         //              (terminated)
		.av_writebyteenable       (),                                                                             //              (terminated)
		.av_lock                  (),                                                                             //              (terminated)
		.uav_clken                (1'b0),                                                                         //              (terminated)
		.av_debugaccess           (),                                                                             //              (terminated)
		.av_outputenable          (),                                                                             //              (terminated)
		.uav_response             (),                                                                             //              (terminated)
		.av_response              (2'b00),                                                                        //              (terminated)
		.uav_writeresponserequest (1'b0),                                                                         //              (terminated)
		.uav_writeresponsevalid   (),                                                                             //              (terminated)
		.av_writeresponserequest  (),                                                                             //              (terminated)
		.av_writeresponsevalid    (1'b0)                                                                          //              (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS        (1),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2),
		.RESET_REQUEST_PRESENT   (1)
	) rst_controller (
		.reset_in0  (~reset_reset_n),                     // reset_in0.reset
		.clk        (clk_clk),                            //       clk.clk
		.reset_out  (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req  (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_in1  (1'b0),                               // (terminated)
		.reset_in2  (1'b0),                               // (terminated)
		.reset_in3  (1'b0),                               // (terminated)
		.reset_in4  (1'b0),                               // (terminated)
		.reset_in5  (1'b0),                               // (terminated)
		.reset_in6  (1'b0),                               // (terminated)
		.reset_in7  (1'b0),                               // (terminated)
		.reset_in8  (1'b0),                               // (terminated)
		.reset_in9  (1'b0),                               // (terminated)
		.reset_in10 (1'b0),                               // (terminated)
		.reset_in11 (1'b0),                               // (terminated)
		.reset_in12 (1'b0),                               // (terminated)
		.reset_in13 (1'b0),                               // (terminated)
		.reset_in14 (1'b0),                               // (terminated)
		.reset_in15 (1'b0)                                // (terminated)
	);

endmodule
