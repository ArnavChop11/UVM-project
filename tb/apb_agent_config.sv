`ifndef APB_AGENT_CONFIG_SV
    `define APB_AGENT_CONFIG_SV

    `include "uvm_macros.svh"

    class apb_agent_config extends uvm_component;

        `uvm_component_utils(apb_agent_config)

        function new(string name = "apb_agent_config", uvm_component parent = null);
            super.new(name, parent);
        endfunction

        virtual apb_if vif; 

    endclass

`endif