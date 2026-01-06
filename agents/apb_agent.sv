`ifndef APB_AGENT
	`define APB_AGENT

class apb_agent extends uvm_agent;
  
  apb_agent_config agent_config; 
  
  `uvm_component_utils(apb_agent)
  
  function new(string name= "", uvm_component parent); 
    super.new(name,parent); 
  endfunction
  
  
  virtual function void build_phase(uvm_phase); 
    super.build_phase(phase); 
    
    agent_config = apb_agent_config::type_id::create("agent_config", this); 
  endfunction 
  

`endif
