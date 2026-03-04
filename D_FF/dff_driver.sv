`include "uvm_macros.svh"
import uvm_pkg::*;

class dff_driver extends uvm_driver#(dff_tx);
  `uvm_component_utils(dff_driver)
  virtual dff_inf vif;
  dff_tx tx;
  function new(string name = "dff_driver" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dff_inf)::get(this,"","vif",vif))
      `uvm_fatal("DRV_VIF","virtual interface is not recieved");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    repeat(10) begin
      //forever begin
      seq_item_port.get_next_item(tx);
      @(posedge vif.clk);
      vif.d <= tx.d;
      seq_item_port.item_done();
      
      `uvm_info(get_type_name(),$sformatf("driver driven data %0b",tx.d),UVM_LOW);
      
    end
  endtask
endclass
