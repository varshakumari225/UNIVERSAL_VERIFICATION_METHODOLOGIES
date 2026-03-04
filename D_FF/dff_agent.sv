`include "uvm_macros.svh"
import uvm_pkg::*;

class dff_agent extends uvm_agent;
  `uvm_component_utils(dff_agent)
  dff_sequencer seqr;
  dff_driver drv;
  dff_monitor mon;
  virtual dff_inf vif;
  
  function new(string name = "dff_agent" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dff_inf)::get(this,"","vif",vif))
      
	`uvm_fatal(get_type_name(),"interface not recieved");
    
    seqr=dff_sequencer::type_id::create("seqr",this);
    drv=dff_driver::type_id::create("drv",this);
    mon=dff_monitor::type_id::create("mon",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
    drv.vif=vif;
    mon.vif=vif;
  endfunction
  
endclass
  
