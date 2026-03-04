`include "uvm_macros.svh"
import uvm_pkg::*;

class fifo_rdriver extends uvm_driver#(fifo_tx);
  `uvm_component_utils(fifo_rdriver)
  virtual fifo_inf dvif;
  fifo_tx req;
  
  function new(string name = "fifo_rdriver" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual fifo_inf)::get(this,"","vif",dvif))
    `uvm_fatal(get_type_name(),"INTERFACE NOT GET");
  endfunction
       
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    repeat(8) begin
      req=fifo_tx::type_id::create("req");
      seq_item_port.get_next_item(req);
      if(req.r_en==1)
        read_drive();
      seq_item_port.item_done();
    end
  endtask
  
  
  task read_drive();
    @(posedge dvif.clk);
    dvif.r_en<=1'b1;
    @(posedge dvif.clk);
    `uvm_info(get_type_name(),$sformatf("data_out : %0d",dvif.data_out),UVM_LOW);
    
    dvif.r_en<=1'b0;
  endtask
  
endclass   
