`include "uvm_macros.svh"
import uvm_pkg::*;

class dff_env extends uvm_env;
  `uvm_component_utils(dff_env)
  dff_agent age;
  dff_sb scoreboard;
  function new(string name = "dff_env", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    age=dff_agent :: type_id :: create("age",this);
    scoreboard=dff_sb :: type_id ::create("scoreboard",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    age.mon.mon_ap.connect(scoreboard.sb_imp);
  endfunction
  
endclass

  
