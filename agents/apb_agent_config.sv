`ifndef APB_AGENT_CONFIG
	`define APB_AGENT_CONFIG


class apb_agent_config extends uvm_component;
  
  local apb_virtual_interface vif; 
  
  `uvm_component_utils(apb_agent_config)
  
  function new(string name= "", uvm_component parent); 
    super.new(name,parent); 
  endfunction
  
  //getter and setter
  virtual function apb_virtual_interface get_vif();
    return vif
  endfunction
  
  virtual function void set_vif(apb_virtual_interface value);
    if (vif == null) begin  // Making sure it is only set once
      vif = value; 
    end else begin 
      `uvm_fatal("Trying to set virtual interface more than once"); 
    end 
  endfunction 
      
      
  //Something
      virtual function void start_of_sim(uvm_phase phase); 
        
        super.start_of_sim(phase); 
        
        if(get_vif() == null) begin
          `uvm_fatal("APB interface not configured at start of simulation phase")
        end else begin 
          `uvm_info("APB interface is configured at start of similation phase :)", UVM_LOW) 
        end 
        
      endfunction 
      
endclass 


`endif
