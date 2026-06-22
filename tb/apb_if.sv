`ifndef APB_IF_SV
    `define APB_IF_SV

    `include "uvm_macros.svh"

    `ifndef APB_DATA_WIDTH
        `define APB_DATA_WIDTH 32
    `endif

    `ifndef APB_ADDR_WIDTH
        `define APB_ADDR_WIDTH 16
    `endif

    interface apb_if(input bit clk);

        logic rst_n;
        logic [`APB_ADDR_WIDTH-1:0] paddr;
        logic [`APB_DATA_WIDTH-1:0] pwdata;
        logic [`APB_DATA_WIDTH-1:0] prdata;
        logic penable;
        logic pwrite;
        logic psel;
        logic pready;
        logic pslverr;

        bit has_checks; 

        initial begin
            has_checks = 1; 
        end

        sequence setup_sequence;
            (psel == 1) &&
            (
                ($past(psel,    1, 1'b1, @(posedge clk)) == 0) ||
                (
                    ($past(penable, 1, 1'b1, @(posedge clk)) == 1) &&
                    ($past(pready,  1, 1'b1, @(posedge clk)) == 1)
                )
            );
        endsequence


        sequence access_sequence; 
            (psel == 1) && (penable == 1); 
        endsequence

        property penable_at_setup_prop;
            @(posedge clk) disable iff (!rst_n || !has_checks)
            setup_sequence |-> penable == 0; // penable must be = 0 after setup_sequence
        endproperty

        property penable_after_setup_prop;
            @(posedge clk) disable iff (!rst_n || !has_checks)
            setup_sequence |=> penable == 1; // penable must be = 0 after setup_sequence
        endproperty

        property penable_after_access_prop; 
            @(posedge clk) disable iff (!rst_n || !has_checks)
            access_sequence and (pready == 1) |=> penable == 0;
        endproperty

        property penable_during_access_prop; 
            @(posedge clk) disable iff (!rst_n || !has_checks)
            access_sequence |-> penable == 1;
        endproperty

        property pwrite_during_access_prop; 
            @(posedge clk) disable iff (!rst_n || !has_checks)
            access_sequence |-> $stable(pwrite); // checks if pwrite is equal to pwrite in previous clock cycle
        endproperty

        property pwdata_during_access_prop; 
            @(posedge clk) disable iff (!rst_n || !has_checks)
            access_sequence and (pwrite == 1) |-> $stable(pwdata); 
        endproperty

        property paddr_during_access_prop; 
            @(posedge clk) disable iff (!rst_n || !has_checks)
            access_sequence |-> $stable(paddr); 
        endproperty



        PENABLE_AT_SETUP: assert property(penable_at_setup_prop) else $error("penable at setup phase is equal to 0"); 

        PENABLE_AFTER_SETUP: assert property (penable_after_setup_prop) else $error("penable is not high after setup");

        PENABLE_AFTER_ACCESS: assert property (penable_after_access_prop) else $error ("penable was not dessarted after access"); 

        PENABLE_DURING_ACCESS: assert property (penable_during_access_prop) else $error ("penable not stable during access");

        PWRITE_DURING_ACCESS: assert property (pwrite_during_access_prop) else $error ("pwrite not stable during access");

        PWDATA_DURING_ACCESS: assert property (pwdata_during_access_prop) else $error ("pwdata not stable during access");  

        PADDR_DURING_ACCESS: assert property (paddr_during_access_prop) else $error ("paddr not stable during access");   

    endinterface

`endif