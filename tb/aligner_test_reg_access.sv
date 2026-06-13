`ifndef ALIGNER_TEST_REG_ACCESS_SV
    `define ALIGNER_TEST_REG_ACCESS_SV

    class aligner_test_reg_access extends aligner_test_base;

        `uvm_component_utils(aligner_test_reg_access)

        function new(string name = "aligner_test_reg_access", uvm_component parent = null);
            super.new(name, parent);
        endfunction

          task run_phase(uvm_phase phase);
            phase.raise_objection(this);

            #100ns; 

            for (int i = 0; i < 10; i++) begin
                apb_item_driver apb_item = apb_item_driver::type_id::create("apb_item");
                apb_item.randomize();

                `uvm_info("ALIGNER_TEST", $sformatf("[ITEM NUMBER: %0d] item: %0s", i, apb_item.convert2string()), UVM_LOW)
            end

                `uvm_info("ALIGNER_TEST", "Test completed", UVM_LOW)

            phase.drop_objection(this);
        endtask

    endclass

`endif