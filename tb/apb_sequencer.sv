`ifndef APB_SEQUENCER_SV
    `define APB_SEQUENCER_SV

    `include "uvm_macros.svh"

    class apb_sequencer extends uvm_sequencer #(apb_item_driver);

        `uvm_component_utils(apb_sequencer)

        function new(string name = "apb_sequencer", uvm_component parent = null);
            super.new(name, parent);
        endfunction

    endclass

`endif