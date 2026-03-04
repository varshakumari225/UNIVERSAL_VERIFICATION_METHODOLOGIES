interface dff_inf(input logic clk,input logic rst);
  logic d;
  logic q;
  
  property dff_prop;
    @(posedge clk) disable iff(rst)
    q==$past(d);
    
  endproperty
  
  assert_prob:assert property(dff_prop)
    else
      $error("dff output not match");
    
endinterface
