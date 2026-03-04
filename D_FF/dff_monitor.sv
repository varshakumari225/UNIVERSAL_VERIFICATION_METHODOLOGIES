`include "uvm_macros.svh"
import uvm_pkg::*;

class dff_monitor extends uvm_monitor;
  `uvm_component_utils(dff_monitor)
  virtual dff_inf vif;
   dff_tx tx;
  uvm_analysis_port#(dff_tx)mon_ap;
  
  function new(string name = "dff_monitor" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_ap=new("mon_ap",this);
    if(!uvm_config_db#(virtual dff_inf)::get(this,"","vif",vif))
      
	`uvm_fatal(get_type_name(),"interface not recieved");
    
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    repeat(10) begin
    //forever begin
    @(posedge vif.clk);
      tx=dff_tx::type_id::create("tx");
      tx.d=vif.d;
      tx.q=vif.q;
      mon_ap.write(tx);
      `uvm_info(get_type_name(),$sformatf("[MONITOR] received data d =%0d | q=%0d",tx.d,tx.q),UVM_LOW);
      
    end
  endtask
  
endclass
      
       
  
