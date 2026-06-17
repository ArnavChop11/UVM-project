`ifndef APB_SEQUENCE_BASE_SV
    `define APB_SEQUENCE_BASE_SV

    `include "uvm_macros.svh"

    class apb_sequence_base extends uvm_sequence #(apb_item_driver);

        `uvm_declare_p_sequencer(apb_sequencer) 

        `uvm_object_utils(apb_sequence_base)

        function new(string name = "apb_sequence_base");
            super.new(name);
        endfunction

        function void print_testname(string test_type); 
            `uvm_info("TEST_TYPE", test_type, UVM_NONE)
        endfunction

    endclass

`endif