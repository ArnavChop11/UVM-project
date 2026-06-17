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

            fork
                begin
                    apb_sequence_simple reg_access_seq;
                    reg_access_seq = apb_sequence_simple::type_id::create("reg_access_seq");

                    //reg_access_seq.item.test_label = "SIMPLE_TEST";

                    reg_access_seq.randomize() with {
                        item.addr == 'h222;
                    };

                    reg_access_seq.start(env.agent.sequencer);
                end

                begin

                    apb_sequence_rw seq_rw;

                    seq_rw = apb_sequence_rw::type_id::create("seq_rw");

                    //seq_rw.item.test_label = "RW_TEST";

                    seq_rw.randomize() with {
                        address == 'h4;
                        
                    };

                    seq_rw.start(env.agent.sequencer);

                end

                begin

                    apb_sequence_rand seq_rand;

                    seq_rand = apb_sequence_rand::type_id::create("seq_rand");
                    //seq_rand.item.test_label = "RAND_TEST";
                    assert(seq_rand.randomize() with { 
                        num_items == 1;  
                    }) else `uvm_fatal("ALIGNER_TEST", "Failed to randomize seq_rand");

                    seq_rand.start(env.agent.sequencer); 

                end
            join
                phase.drop_objection(this);
            
        endtask

    endclass

`endif