`include "uvm_macros.svh"
import uvm_pkg::*;

class fifo_wagent extends uvm_agent;
  `uvm_component_utils(fifo_wagent)
  fifo_wseqr wseqr;
  //fifo_rseqr rseqr;
  fifo_wdriver wdriver;
  fifo_wmonitor wmonitor;
  
  function new(string name = "fifo_wagent" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wseqr=fifo_wseqr::type_id::create("wseqr",this); 
    wdriver=fifo_wdriver::type_id::create("driver",this);
    wmonitor=fifo_wmonitor::type_id::create("monitor",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    wdriver.seq_item_port.connect(wseqr.seq_item_export);
    
  endfunction
  
endclass
