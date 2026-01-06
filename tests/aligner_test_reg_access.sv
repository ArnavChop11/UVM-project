`ifndef ALIGNER_TEST_REG_ACCESS
	`define ALIGNER_TEST_REG_ACCESS

class aligner_test_reg_access extends aligner_test_base; 
  
  `uvm_component_utils(aligner_test_reg_access)
  
  function new(string name= "", uvm_component parent); 
    super.new(name,parent); 
  endfunction
  
  virtual task run_phase (uvm_phase phase); 
    phase.raise_objection(this, "TEST_DONE");
    
    `uvm_info("DEBUG", "start of test", UVM_LOW)
    
    #100ns; 
    
    
    `uvm_info("DEBUG", "end of test", UVM_LOW)
    phase.drop_objection(this, "TEST_DONE");
    
  endtask
  
  
endclass


`endif