`include "uvm_macros.svh"
import uvm_pkg::*;

class fifo_rmonitor extends uvm_monitor;
  `uvm_component_utils(fifo_rmonitor)
  virtual fifo_inf mvif;
  uvm_analysis_port#(fifo_tx)mon_ap;
  fifo_tx mon_item;
  
  function new(string name = "fifo_rmonitor" ,uvm_component parent);
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
	  	if (mvif.r_en==1)begin
          
        mon_item.r_en=mvif.r_en;
        mon_item.empty=mvif.empty;
      
        `uvm_info(get_type_name(),$sformatf(" [READING] %0s",mon_item.convert2string()),UVM_LOW);
          @(posedge mvif.clk);
          mon_item.data_out=mvif.data_out;
      mon_ap.write(mon_item);
    	end
    end
  endtask
  
endclass
