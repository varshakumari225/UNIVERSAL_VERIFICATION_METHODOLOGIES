class dff_sb extends uvm_scoreboard;
  `uvm_component_utils(dff_sb)
  uvm_analysis_imp#(dff_tx,dff_sb)sb_imp;
  
  int total_tx;
  int pass_count,fail_count;
  
  function new(string name = "dff_sb" , uvm_component parent);
    super.new(name,parent);
    sb_imp=new("sb_imp",this);
  endfunction
  bit exp_q;
  
  function write(dff_tx tx);
    total_tx++;
    if(tx.q==exp_q)begin
      pass_count++;
      //`uvm_info(get_type_name(),"both are equal",UVM_LOW);
    end
    else begin
      fail_count++;
      `uvm_info(get_type_name(),$sformatf("both are not equal d : %0d | q : %0d",exp_q,tx.q),UVM_LOW);
    end
    
    exp_q=tx.d;
    
  endfunction
  
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info(get_type_name(),$sformatf("total transaction : %0d | pass count : %0d | fail count : %0d ",total_tx,pass_count,fail_count),UVM_LOW);
  endfunction
  
endclass
