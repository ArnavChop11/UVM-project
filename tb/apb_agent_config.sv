`ifndef APB_AGENT_CONFIG_SV
    `define APB_AGENT_CONFIG_SV

    `include "uvm_macros.svh"

    class apb_agent_config extends uvm_component;

        local uvm_active_passive_enum is_active; 

        local bit has_checks;

        local bit has_coverage; 

        `uvm_component_utils(apb_agent_config)

        function new(string name = "apb_agent_config", uvm_component parent = null);
            super.new(name, parent);

            set_is_active(UVM_ACTIVE);
            has_checks = 1; // default value
        endfunction

        local apb_vif vif;

        // getter for uvm_active
        virtual function uvm_active_passive_enum get_is_active();
            return is_active;
        endfunction

        // setter for uvm_active
        virtual function void set_is_active(uvm_active_passive_enum mode);
            is_active = mode;
        endfunction

        //Getter for the APB virtual interface
        virtual function apb_vif get_vif();
            return vif;
        endfunction
        
        //Setter for the APB virtual interface
        virtual function void set_vif(apb_vif value);
            if(vif == null) begin
                vif = value;
                set_has_checks(get_has_checks()); 
            end
        else begin
            `uvm_fatal("ALGORITHM_ISSUE", "Trying to set the APB virtual interface more than once")
        end
        endfunction

        // getter for has_checks
        virtual function bit get_has_checks();
            return has_checks; 
        endfunction 

        // setter for has_checks
        virtual function void set_has_checks(bit mode); 
            has_checks = mode;

            if (vif != null ) begin 
                vif.has_checks = has_checks; 
            end 
        endfunction

        virtual function bit get_has_coverage();
            return has_coverage; 
        endfunction 

        // setter for has_checks
        virtual function void set_has_coverage(bit mode); 
            has_coverage = mode; 
        endfunction

        virtual function void start_of_simulation_phase(uvm_phase phase);
            super.start_of_simulation_phase(phase);
        
            if(get_vif() == null) begin
                `uvm_fatal("ALGORITHM_ISSUE", "The APB virtual interface is not configured at \"Start of simulation\" phase")
            end
            else begin
                `uvm_info("APB_CONFIG", "The APB virtual interface is configured at \"Start of simulation\" phase", UVM_DEBUG)
            end
        endfunction

        virtual task run_phase(uvm_phase phase); 
            forever begin
                @(vif.has_checks); 

                if (vif.has_checks != get_has_checks()) begin
                    `uvm_error("ALGORITHM_ERROR", "vif.has_checks is not synced with has_checks"); 
                end
                
            end

        endtask  
 

    endclass

`endif