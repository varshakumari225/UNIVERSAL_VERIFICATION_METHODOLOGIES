`include "uvm_macros.svh"
import uvm_pkg::*;

class dff_tx extends uvm_sequence_item;
  rand bit d;
  bit q;
  
  `uvm_object_utils(dff_tx)
  
  function new(string name = "dff_tx");
    super.new(name);
  endfunction
  
  function string convert2string();
    return $sformatf("%0d=%0b","expected q = %0d",d,q);
  endfunction
  
endclass
