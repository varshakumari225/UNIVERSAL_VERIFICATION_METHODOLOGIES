`include "uvm_macros.svh"
import uvm_pkg::*;

class fifo_wseqr extends uvm_sequencer#(fifo_tx);
  `uvm_component_utils(fifo_wseqr)
  
  function new(string name = "fifo_wseqr" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass
