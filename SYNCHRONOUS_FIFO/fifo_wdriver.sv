`include "uvm_macros.svh"
import uvm_pkg::*;

class fifo_wdriver extends uvm_driver#(fifo_tx);
  `uvm_component_utils(fifo_wdriver)
  virtual fifo_inf dvif;
  fifo_tx req;
  
  function new(string name = "fifo_wdriver" , uvm_component parent);
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
      
      if(req.w_en==1)
        write_drive(req.data_in);
      seq_item_port.item_done();
    end
  endtask
  
  task write_drive(input [`width-1:0]din);
    @(posedge dvif.clk);
    dvif.w_en<=1'b1;
    dvif.data_in<=din;
    `uvm_info(get_type_name(),$sformatf("data_in : %0d",dvif.data_in),UVM_LOW);
    @(posedge dvif.clk);
    dvif.w_en<=1'b0;
  endtask
  
endclass   
