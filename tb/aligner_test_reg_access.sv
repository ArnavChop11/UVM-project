`ifndef ALIGNER_TEST_REG_ACCESS_SV
    `define ALIGNER_TEST_REG_ACCESS_SV

    class aligner_test_reg_access extends aligner_test_base;

        `uvm_component_utils(aligner_test_reg_access)

        function new(string name = "aligner_test_reg_access", uvm_component parent = null);
            super.new(name, parent);
        endfunction

          task run_phase(uvm_phase phase);
            phase.raise_objection(this);

            `uvm_info("TEST", "aligner_test_reg_access started", UVM_LOW)

            #100ns;

            `uvm_info("TEST", "aligner_test_reg_access finished", UVM_LOW)

            phase.drop_objection(this);
        endtask

    endclass

`endif