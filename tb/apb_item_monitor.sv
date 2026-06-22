`ifndef APB_ITEM_MONITOR_SV
    `define APB_ITEM_MONITOR_SV


    `include "uvm_macros.svh"

    class apb_item_monitor extends apb_item_base; 

        `uvm_object_utils(apb_item_monitor)

        function new(string name = "apb_item_monitor");
            super.new(name); 
        endfunction 

        apb_response_t response; 
        int length; 
        int prev_item_delay; 

        virtual function string convert2string(); 

            string result = super.convert2string(); 
            result = $sformatf("%s, data: %0x, response: %0s, length: %0d, prev_item_delay: %0d", result, data, response.name(), length, prev_item_delay);

             return result;
        endfunction 




    endclass

`endif