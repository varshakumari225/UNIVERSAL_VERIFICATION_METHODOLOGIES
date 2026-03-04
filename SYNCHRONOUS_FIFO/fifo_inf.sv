
interface fifo_inf(input logic clk,input logic rst);
  logic [`width-1:0] data_in;
  logic w_en,r_en;
  logic empty,full;
  logic [`width-1:0] data_out;
  
endinterface
  
