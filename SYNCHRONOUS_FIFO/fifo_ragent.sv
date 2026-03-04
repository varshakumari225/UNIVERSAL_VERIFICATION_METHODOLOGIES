
`include "uvm_macros.svh"
import uvm_pkg::*;

class fifo_ragent extends uvm_agent;
  `uvm_component_utils(fifo_ragent)
  fifo_wseqr wseqr;
  fifo_rseqr rseqr;
  fifo_rdriver rdriver;
  fifo_rmonitor rmonitor;
  
  function new(string name = "fifo_ragent" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase); 
    rseqr=fifo_rseqr::type_id::create("rseqr",this);
    rdriver=fifo_rdriver::type_id::create("rdriver",this);
    rmonitor=fifo_rmonitor::type_id::create("rmonitor",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   	rdriver.seq_item_port.connect(rseqr.seq_item_export);
  endfunction
  
endclass
