`ifndef APB_ITEM_DRIVER_SV
    `define APB_ITEM_DRIVER_SV

    `include "uvm_macros.svh"
    `include "apb_pkg.sv"

    class apb_item_driver extends apb_item_base;

        `uvm_object_utils(apb_item_driver)

        function new(string name = "apb_item_driver");
            super.new(name);
        endfunction


        rand apb_addr_t addr;
        rand apb_data_t data;
        rand apb_rw_t rw;

        rand int unsigned pre_drive_delay;
        rand int unsigned post_drive_delay;

        constraint c_pre_drive_delay { pre_drive_delay <= 5; }
        constraint c_post_drive_delay { post_drive_delay <= 5; }

        virtual function string convert2string();

            string result; 

            if (rw == APB_WRITE) begin

                result = $sformatf("dir: %0s, addr: %0h, data: %0h", rw.name(), addr, data); 

            end
                result =  $sformatf("addr: %h, data: %h, rw: %b, pre_drive_delay: %0d, post_drive_delay: %0d", 
                    addr, data, rw, pre_drive_delay, post_drive_delay);

        return result; 
        endfunction

    endclass

`endif