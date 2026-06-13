`ifndef ALIGNER_TEST_BASE_SV
    `define ALIGNER_TEST_BASE_SV

    class aligner_test_base extends uvm_test;

        `uvm_component_utils(aligner_test_base)

        function new(string name = "aligner_test_base", uvm_component parent = null);
            super.new(name, parent);
        endfunction

        aligner_env env;

        virtual function void build_phase(uvm_phase phase);
            super.build_phase(phase);

            env = aligner_env::type_id::create("env", this);

        endfunction

         virtual function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);

        uvm_top.print_topology();
  endfunction

    endclass

`endif