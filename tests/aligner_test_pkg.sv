`ifndef ALIGNER_TEST_PKG
	`define ALIGNER_TEST_PKG

`include "uvm_macros.svh" 
`include "aligner_env_pkg.sv" 
`include "apb_agent_pkg.sv"

package aligner_test_pkg;

import uvm_pkg::*; 
import aligner_env_pkg::*;
import apb_agent_pkg::*; 

`include "aligner_test_base.sv" 
`include "aligner_test_reg_access.sv" 

endpackage


`endif

`include "aligner_test_pkg.sv"