`ifndef ALIGNER_TEST_BASE
	`define ALIGNER_TEST_BASE

class aligner_test_base extends uvm_test; 
  
  aligner_env env; 
  
  `uvm_component_utils(aligner_test_base)
  
  function new(string name= "", uvm_component parent); 
    super.new(name,parent); 
  endfunction
  
  
  virtual function void build_phase(uvm_phase phase); 
    super.build_phase(phase);
    
    env = aligner_env::type_id::create("env", this); 
    
  endfunction 
  
  
endclass


`endif