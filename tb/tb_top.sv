
import uvm_pkg::*;
`include "uvm_macros.svh"

class smoke_test extends uvm_test;
  `uvm_component_utils(smoke_test)

  function new(string name = "smoke_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    `uvm_info("SMOKE", "Vivado XSim UVM smoke test is running", UVM_LOW)

    #10ns;

    `uvm_info("SMOKE", "Vivado XSim UVM smoke test passed", UVM_LOW)

    phase.drop_objection(this);
  endtask
endclass

module tb_top;
  initial begin
    run_test("smoke_test");
  end
endmodule