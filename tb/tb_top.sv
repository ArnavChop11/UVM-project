`include "uvm_macros.svh"
`include "test_pkg.sv"

module tb_top();

import uvm_pkg::*;
import aligner_test_pkg::*;

logic clk;
logic rst_n;

apb_if vif(.clk(clk));

initial begin
    clk = 0; 
    forever begin
        clk = #5ns ~clk;
    end

end

initial begin
    vif.rst_n = 1;
    #6ns;
    vif.rst_n = 0;
    #30ns;
    vif.rst_n = 1;
end

initial begin
    uvm_config_db#(virtual apb_if)::set(null, "uvm_test_top.env.apb_agent", "vif", vif); // put the vif in the database

    run_test("aligner_test_reg_access"); // Pass  test name to run test 
end

cfs_aligner DUT(
    .clk(clk), 
    .reset_n(vif.rst_n),

    .paddr(vif.paddr),
    .pwdata(vif.pwdata),
    .prdata(vif.prdata),
    .penable(vif.penable),
    .pwrite(vif.pwrite),
    .psel(vif.psel),
    .pready(vif.pready),
    .pslverr(vif.pslverr)

);


endmodule