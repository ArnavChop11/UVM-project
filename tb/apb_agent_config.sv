`ifndef APB_AGENT_CONFIG_SV
    `define APB_AGENT_CONFIG_SV

    `include "uvm_macros.svh"

    class apb_agent_config extends uvm_component;

        local uvm_active_passive_enum is_active; 

        `uvm_component_utils(apb_agent_config)

        function new(string name = "apb_agent_config", uvm_component parent = null);
            super.new(name, parent);

            set_is_active(UVM_ACTIVE);
        endfunction

        local apb_vif vif;

        virtual function uvm_active_passive_enum get_is_active();
            return is_active;
        endfunction

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
            end
        else begin
            `uvm_fatal("ALGORITHM_ISSUE", "Trying to set the APB virtual interface more than once")
        end
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
 

    endclass

`endif