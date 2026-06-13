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

    endinterface

`endif