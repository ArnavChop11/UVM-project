ters`include "aligner_test_pkg.sv"

module uvm_testbench();
  
  import uvm_pkg::*;
  import aligner_test_pkg::*; 
  
  parameter CLK_PERIOD = 10ns;
  
  //clk creation
  
  logic clk; 
  
  initial begin 
    clk = 0; 
    
    forever begin 
      clk = #(CLK_PERIOD/2) ~clk; 
    end 
  end
  
/*  //reset signal
  
  logic reset_n; 
  
*/
  
  //APB interface instantiation
  apb_interface apb_if(.apb_clk(clk)); 
  
  initial begin
    apb_if.reset = 1; 
    #5ns; 
    apb_if.reset = 0; //This is where we reset
    #30ns; 
    apb_if.reset = 1; 
  end
   
  
  //testbench begins here
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars; 
    
    uvm_config_db#(virtual apb_interface)::set(null, "tb_top.env.apb_agent", "vif", apb_if); 
    
    run_test(""); 
    
  end
    
  
  
  cfs_aligner dut(
    .clk (clk), 
    .reset_n(apb_if.reset), 
    
    .paddr(apb_if.paddr), 
    .pwrite(apb_if.pwrite), 
    .psel(apb_if.psel), 
    .penable(apb_if.penable), 
    .pwdata(apb_if.pwdata),
    .pready(apb_if.pready),
    .prdata(apb_if.prdata), 
    .pslverr(apb_if.pslverr)
    
 
  ); 
  
endmodule 