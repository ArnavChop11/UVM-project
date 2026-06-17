`ifndef APB_AGENT_SV
    `define APB_AGENT_SV

    `include "uvm_macros.svh"

    class apb_agent extends uvm_agent;

        apb_agent_config agent_cfg;
        virtual apb_if vif;

        apb_sequencer sequencer;
        apb_driver driver;

        `uvm_component_utils(apb_agent)

        function new(string name = "apb_agent", uvm_component parent = null);
            super.new(name, parent);
        endfunction






        virtual function void build_phase(uvm_phase phase);

            super.build_phase(phase);

            agent_cfg = apb_agent_config::type_id::create("agent_cfg", this);

            if (agent_cfg.get_is_active() == UVM_ACTIVE) begin
                sequencer = apb_sequencer::type_id::create("sequencer", this);
                driver = apb_driver::type_id::create("driver", this);
            end

        endfunction





        virtual function void connect_phase(uvm_phase phase);

            super.connect_phase(phase);

            if (uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif) == 0) begin
                `uvm_fatal("APB_AGENT", "Virtual interface not set for apb_agent_config")
            end

            agent_cfg.set_vif(vif);

            if (agent_cfg.get_is_active() == UVM_ACTIVE) begin
                driver.cfg = agent_cfg;
                driver.seq_item_port.connect(sequencer.seq_item_export);
            end



        endfunction

    endclass

`endif