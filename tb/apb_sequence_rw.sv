`ifndef ABP_SEQUENCE_RW_SV
    `define APB_SEQUENCE_RW_SV

    `include "uvm_macros.svh"

    class apb_sequence_rw extends apb_sequence_base;

    rand apb_addr_t address;
    rand apb_data_t data;
    rand apb_item_driver item;

        `uvm_object_utils(apb_sequence_rw)

        function new(string name = "apb_sequence_rw");
            super.new(name);
        endfunction

        virtual task body();
            item = apb_item_driver::type_id::create("RW_TEST");
            assert(item != null) else `uvm_fatal("APB_SEQ_RW", "Failed to create item");

            item.randomize() with {
                item.addr == address;
                item.rw == APB_READ; // Assuming this sequence is for read operations
            }; 

            //item.test_label = "RW_TEST";
            start_item(item);
            finish_item(item);

        endtask


    endclass

`endif