`ifndef APB_INTERFACE
	`define APB_INTERFACE

interface apb_interface(
  
input apb_clk
  
); 
  
  //APB signals from datasheet
  logic reset, psel, pwrite, pready, pslverr, penable; 
  logic [15:0] paddr; 
  logic [31:0] pwdata, prdata; 
  
endinterface 


`endif