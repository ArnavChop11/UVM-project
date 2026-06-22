`ifndef APB_MONITOR_SV
    `define APB_MONITOR_SV

    `include "uvm_macros.svh"

class apb_monitor extends uvm_monitor; 

    apb_agent_config cfg; 

    uvm_analysis_port #(apb_item_monitor) output_port; 

    `uvm_component_utils(apb_monitor);

    function new(string name = "apb_monitor", uvm_component parent); 
        super.new(name, parent); 

        output_port = new("output_port", this); 
    endfunction

    virtual task run_phase(uvm_phase phase); 
        forever begin
            apb_vif vif = cfg.get_vif();
            apb_item_monitor item = apb_item_monitor::type_id::create("monitor_item");

            while (vif.psel !== 1) begin
                @(posedge vif.clk); 
                item.prev_item_delay++; 
            end

            item.addr   = vif.paddr;
            item.rw    = apb_rw_t'(vif.pwrite);

            if(item.rw == APB_WRITE) begin
                item.data = vif.pwdata;
            end

            item.length = 1; 

            @(posedge vif.clk);

            while (vif.pready !== 1) begin
                @(posedge vif.clk);
                item.length++; 
            end

            item.response = apb_response_t'(vif.pslverr);

            if(item.rw == APB_READ) begin
                item.data = vif.prdata;
            end

            output_port.write(item); 

            `uvm_info("APB_MONITOR", $sformatf("Monitored item: %s", item.convert2string()), UVM_NONE)
      

             @(posedge vif.clk);
        end

    endtask 

endclass 

`endif