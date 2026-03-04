`include "uvm_macros.svh"
import uvm_pkg::*;

class fifo_sb extends uvm_scoreboard;
  `uvm_analysis_imp_decl(_wr)
`uvm_analysis_imp_decl(_rd)
  `uvm_component_utils(fifo_sb)
  uvm_analysis_imp_wr#(fifo_tx, fifo_sb)wr_imp;
  uvm_analysis_imp_rd#(fifo_tx, fifo_sb)rd_imp;
  
  function new(string name = "fifo_sb" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  fifo_tx que[$];
  fifo_tx exp;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wr_imp=new("wr_imp",this);
    rd_imp=new("rd_imp",this);
  endfunction
  
  function void write_wr(fifo_tx tx);
    que.push_back(tx);
    `uvm_info(get_type_name(),$sformatf("data_in : %0d",tx.data_in),UVM_LOW);
  endfunction
  
  function void write_rd(fifo_tx tx);
   exp=que.pop_front();
    if(que.size()==0)begin
      `uvm_error("sb","read while que is empty");
      return;
    end
    
    
    
    if(exp.data_in != tx.data_out)begin
      `uvm_error(get_type_name(),$sformatf("[MISMATCH] exp : %0d | act : %0d ",exp.data_in,tx.data_out));
    end
    
    else begin
       `uvm_info(get_type_name(),$sformatf("[MATCH] exp : %0d | act : %0d",exp.data_in,tx.data_out),UVM_LOW);
    end
      
  endfunction
  
endclass
                
                
