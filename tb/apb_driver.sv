`ifndef APB_DRIVER_SV
    `define APB_DRIVER_SV

    `include "uvm_macros.svh"

    class apb_driver extends uvm_driver #(apb_item_driver);

        apb_agent_config cfg;

        `uvm_component_utils(apb_driver)

        function new(string name = "apb_driver", uvm_component parent = null);
            super.new(name, parent);
        endfunction

        virtual task run_phase(uvm_phase phase);

            apb_vif vif = cfg.get_vif();

            vif.psel <= 0;
            vif.penable <= 0;
            vif.pwrite <= 0;
            vif.paddr <= 0;
            vif.pwdata <= 0;

            forever begin
                apb_item_driver item;
                seq_item_port.get_next_item(item);

                drive_transaction(item);

                seq_item_port.item_done();
            end
        endtask

        virtual task drive_transaction(apb_item_driver item);

            `uvm_info("APB_DRIVER", $sformatf("TEST NAME: %s \nDriving APB transaction: %0s\n\n", item.get_name(), item.convert2string()), UVM_NONE)

        endtask

    endclass

`endif