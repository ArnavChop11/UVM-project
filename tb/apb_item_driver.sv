`ifndef APB_ITEM_DRIVER_SV
    `define APB_ITEM_DRIVER_SV

    `include "uvm_macros.svh"

    class apb_item_driver extends apb_item_base;

        `uvm_object_utils(apb_item_driver)

        function new(string name = "apb_item_driver");
            super.new(name);
        endfunction


        string test_label;

        rand int unsigned pre_drive_delay;
        rand int unsigned post_drive_delay;

        constraint c_pre_drive_delay { pre_drive_delay <= 5; }
        constraint c_post_drive_delay { post_drive_delay <= 5; }

        virtual function string convert2string();
            string result = super.convert2string();

            if (rw == APB_WRITE) begin
                result = $sformatf("TEST_NAME: %s, %s, data: %0h\n\n", test_label, result, data);
            end 

            result = $sformatf("%s, pre_drive_delay: %0d, post_drive_delay: %0d", 
                         result, pre_drive_delay, post_drive_delay);

            return result;
        endfunction

    endclass

`endif