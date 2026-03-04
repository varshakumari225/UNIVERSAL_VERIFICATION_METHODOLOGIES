`include "uvm_macros.svh"
import uvm_pkg::*;

class fifo_test extends uvm_test;
  `uvm_component_utils(fifo_test)
  fifo_env env;
  virtual_seq vseq;
  
  function new(string name = "fifo_test" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=fifo_env::type_id::create("env",this);
    vseq=virtual_seq::type_id::create("vseq");
    
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    vseq.start(env.v_seqr);
    phase.drop_objection(this);
  endtask
  
endclass
