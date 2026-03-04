`include "uvm_macros.svh"
import uvm_pkg::*;

class fifo_wmonitor extends uvm_monitor;
  `uvm_component_utils(fifo_wmonitor)
  virtual fifo_inf mvif;
  uvm_analysis_port#(fifo_tx)mon_ap;
  fifo_tx mon_item;
  
  function new(string name = "fifo_wmonitor" ,uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual fifo_inf)::get(this,"","vif",mvif))
    `uvm_fatal(get_type_name(),"INTERFACE NOT GET");
    mon_ap=new("mon_ap",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      @(posedge mvif.clk); mon_item=fifo_tx::type_id::create("mon_item");
      if(mvif.w_en==1) begin
        mon_item.data_in=mvif.data_in;
        mon_item.w_en=mvif.w_en;
        //mon_item.r_en=mvif.r_en;
        //mon_item.empty=mvif.empty;
        mon_item.full=mvif.full;
        `uvm_info(get_type_name(),$sformatf(" [WRITING] %0s",mon_item.convert2string()),UVM_LOW);
       
        mon_ap.write(mon_item);
      end
    end
  endtask
  
endclass
