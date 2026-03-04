`include "uvm_macros.svh"
import uvm_pkg::*;
`include "fifo_tx.sv"
`include "fifo_inf.sv"
`include "fifo_wseq.sv"
`include "fifo_rseq.sv"
`include "fifo_vseq.sv"
`include "fifo_wseqr.sv"
`include "fifo_rseqr.sv"
`include "fifo_vseqr.sv"
`include "fifo_wdriver.sv"
`include "fifo_rdriver.sv"
`include "fifo_wmonitor.sv"
`include "fifo_rmonitor.sv"
`include "fifo_wagent.sv"
`include "fifo_ragent.sv"
`include "fifo_sb.sv"
`include "fifo_env.sv"
`include "fifo_test.sv"
module tb_top;
  logic rst_n,clk;
  //interface
  fifo_inf vif(clk,rst_n);
  synchronous_fifo#(`depth ,`width) dut(.rst_n(rst_n),
                .clk(clk),
                .w_en(vif.w_en),
                .r_en(vif.r_en),
                .data_in(vif.data_in),
                .data_out(vif.data_out),
                                        .empty(vif.empty),
                                        .full(vif.full)
               );
  
  //clk generation
  
  initial clk=0;
  always #5 clk=~clk;
  
  //reset
  
  initial begin
    rst_n=0;
    @(posedge clk);
    rst_n=1;
  end
  
  //stimulus
  
  initial begin
    uvm_config_db #(virtual fifo_inf)::set(null,"*","vif",vif);
    run_test("fifo_test");
  end
endmodule
    
  
