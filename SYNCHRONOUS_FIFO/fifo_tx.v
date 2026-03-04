`include "uvm_macros.svh"
import uvm_pkg::*;
`define width 8
`define depth 8
class fifo_tx extends uvm_sequence_item;
  `uvm_object_utils(fifo_tx)
  
  rand bit w_en,r_en;
  rand bit [`width-1:0]data_in;
  bit [`width-1:0]data_out;
  bit full,empty;
  
  function new(string name = "fifo_tx");
    super.new(name);
  endfunction
  constraint c_data{data_in inside{[0:50]};}
  
  constraint c{w_en != r_en;}
  
  function string convert2string();
    return $psprintf("w_en = %0d | r_en = %0d | data_in %0d | data_out = %0d | full = %0d | empty = %0d ",w_en,r_en,data_in,data_out,full,empty);
  endfunction
  
endclass
  
