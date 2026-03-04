`include "uvm_macros.svh"
import uvm_pkg::*;
typedef class virtual_seqr;//forward declaration of the virtual_seqr class
class virtual_seq extends uvm_sequence;
  `uvm_object_utils(virtual_seq)
  `uvm_declare_p_sequencer (virtual_seqr)
  
  fifo_wseq write_seq;
  fifo_rseq read_seq;
  
  function new(string name = "virtual_seq");
    super.new(name);
  endfunction
 
  
  task body();

  write_seq = fifo_wseq::type_id::create("write_seq");
 read_seq  = fifo_rseq::type_id::create("read_seq");
    
    write_seq.start(p_sequencer.write);
    read_seq.start(p_sequencer.read);
    
    /*
    //alternate read_write
    fork 
    write_seq.start(p_sequencer.write);
    read_seq.start(p_sequencer.read);
    join
    */
  endtask
  
endclass
