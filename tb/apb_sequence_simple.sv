`ifndef APB_SEQUENCE_SIMPLE_SV
    `define APB_SEQUENCE_SIMPLE_SV

    `include "uvm_macros.svh"

    class apb_sequence_simple extends apb_sequence_base;

        `uvm_object_utils(apb_sequence_simple)
        
        rand apb_item_driver item;

        function new(string name = "apb_sequence_simple");
            super.new(name);

            item = apb_item_driver::type_id::create("SIMPLE_TEST");

            assert(item != null) else `uvm_fatal("APB_SEQ_SIMPLE", "Failed to create item");

        endfunction

        virtual task body();
            start_item(item);
            finish_item(item);
        endtask

    endclass

`endif