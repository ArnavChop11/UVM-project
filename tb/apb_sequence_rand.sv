`ifndef APB_SEQUENCE_RAND_SV
    `define APB_SEQUENCE_RAND_SV

    class apb_sequence_rand extends apb_sequence_base; 

        rand int num_items; 
        rand apb_item_driver item;

        constraint num_items_c { 
            num_items > 0; 
            num_items < 11; 
        }

        `uvm_object_utils(apb_sequence_rand)

        function new(string name = "apb_sequence_rand");
            super.new(name);
        endfunction

        virtual task body(); 

            for (int i = 0; i < num_items; i++) begin
                item = apb_item_driver::type_id::create($sformatf("RAND_TEST_%0d", i+1));
                assert(item != null) else `uvm_fatal("APB_SEQ_RAND", "Failed to create item");

                //item.test_label = $sformatf("RANDOM_ITEM_%0d", i+1);

                assert(item.randomize()) else `uvm_fatal("APB_SEQ_RAND", "Failed to randomize item");
                start_item(item);
                finish_item(item);
            end

        endtask 

    endclass



`endif