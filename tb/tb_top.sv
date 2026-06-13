`include "uvm_macros.svh"
`include "test_pkg.sv"

module tb_top();

import uvm_pkg::*;
import aligner_test_pkg::*;

logic clk;
logic rst_n;

initial begin
    clk = 0; 
    forever begin
        clk = #5ns ~clk;
    end

end

initial begin
    rst_n = 1;
    #6ns;
    rst_n = 0;
    #30ns;
    rst_n = 1;
end

initial begin
    run_test("aligner_test_reg_access"); // Pass  test name to run test 
end

cfs_aligner DUT(
    .clk(clk), 
    .reset_n(rst_n)
);


endmodule