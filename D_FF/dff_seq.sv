`include "uvm_macros.svh";
import uvm_pkg::*;

class dff_seq extends uvm_sequence#(dff_tx);
  `uvm_object_utils(dff_seq)
  
  function new(string name = "dff_seq");
    super.new(name);
  endfunction
  
  task body();
    dff_tx tx;
    `uvm_info(get_type_name(),"inside the sequence body task",UVM_LOW);
    
    repeat(10) begin
      tx=dff_tx :: type_id :: create("tx");
      start_item(tx);
      assert(tx.randomize());
      finish_item(tx);
    end
    `uvm_info(get_type_name(),$sformatf("transaction %0s",tx.convert2string()),UVM_LOW);
  endtask
  
endclass
