`include "uvm_macros.svh"
import uvm_pkg::*;

class fifo_wseq extends uvm_sequence#(fifo_tx);
  `uvm_object_utils(fifo_wseq)
  fifo_tx req;
  
  function new(string name = "fifo_wseq");
    super.new(name);
  endfunction
  
  task body();
    repeat(8)begin
      req=fifo_tx::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {w_en==1;});
      finish_item(req);
    end 
  endtask
  
endclass
