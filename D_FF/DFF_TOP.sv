`include "uvm_macros.svh"
import uvm_pkg::*;
`include "dff_tx.sv"
`include "dff_intf.sv"
`include "dff_seq.sv"
`include "dff_sequencer.sv"
`include "dff_driver.sv"
`include "dff_monitor.sv"
`include "dff_agent.sv"
`include "dff_sb.sv"
`include "dff_env.sv"
`include "dff_test.sv"

module tb_top;
  logic clk,rst;
  dff dut(.clk(clk),.rst(rst),.d(vif.d),.q(vif.q));
  dff_inf vif(clk,rst);
  
  initial 
    clk=0;
  always #5 clk=~clk;
  
 
  initial begin
    rst=1;vif.d=0;
    #15;
    @(posedge clk);
    rst=0;
  end
  
  initial
    begin
      uvm_config_db#(virtual dff_inf)::set(null,"*","vif",vif);
      
      run_test("dff_test");
      //run_test();
    end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule
