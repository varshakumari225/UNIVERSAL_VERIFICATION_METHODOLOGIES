`include "uvm_macros.svh"
import uvm_pkg::*;

class fifo_env extends uvm_env;
  `uvm_component_utils(fifo_env)
  fifo_wagent wagent;
  fifo_ragent ragent;
  virtual_seqr v_seqr;
  fifo_sb sb;
  
  function new(string name = "fifo_env" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wagent=fifo_wagent::type_id::create("wagent",this);
    ragent=fifo_ragent::type_id::create("ragent",this);
    v_seqr=virtual_seqr::type_id::create("v_seqr",this);
    sb=fifo_sb::type_id::create("sb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    v_seqr.write=wagent.wseqr;
    v_seqr.read=ragent.rseqr;
    wagent.wmonitor.mon_ap.connect(sb.wr_imp);
    ragent.rmonitor.mon_ap.connect(sb.rd_imp);
  endfunction
    
  
endclass

