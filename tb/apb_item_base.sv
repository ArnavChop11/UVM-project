`ifndef APB_ITEM_BASE_SV
    `define APB_ITEM_BASE_SV

    `include "uvm_macros.svh"

    class apb_item_base extends uvm_sequence_item;

        `uvm_object_utils(apb_item_base)

        function new(string name = "apb_item_base");
            super.new(name);
        endfunction

        rand apb_addr_t addr;
        rand apb_data_t data;
        rand apb_rw_t rw;

        virtual function string convert2string();
            string result = $sformatf("R/W: %0s, addr: %0x", rw.name(), addr);
      
        return result;
    endfunction

    endclass

`endif