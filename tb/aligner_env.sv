`ifndef ALIGNER_ENV_SV
    `define ALIGNER_ENV_SV

    `include "uvm_macros.svh"

    class aligner_env extends uvm_env;

        `uvm_component_utils(aligner_env)

        apb_agent agent;

        function new(string name = "aligner_env", uvm_component parent = null);
            super.new(name, parent);
        endfunction

        virtual function void build_phase(uvm_phase phase);
            super.build_phase(phase);

            agent = apb_agent::type_id::create("apb_agent", this);
        endfunction

    endclass

`endif