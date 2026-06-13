`ifndef ALIGNER_ENV_SV
    `define ALIGNER_ENV_SV

    `include "uvm_macros.svh"

    class aligner_env extends uvm_env;

        `uvm_component_utils(aligner_env)

        function new(string name = "aligner_env", uvm_component parent = null);
            super.new(name, parent);
        endfunction

    endclass

`endif