`include "uvm_macros.svh";
import uvm_pkg::*;

class dff_test extends uvm_test;
  `uvm_component_utils(dff_test)
  
  dff_env env;
  dff_seq seq;
  
  function new(string name = "dff_test" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=dff_env :: type_id :: create("env",this);
    seq=dff_seq :: type_id :: create("seq");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    seq.start(env.age.seqr);
    #200;
    phase.drop_objection(this);
  endtask
  
endclass
  
  
