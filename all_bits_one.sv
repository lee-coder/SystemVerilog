program automatic all_bits_one();
initial begin
  bit[63:0] j;
  bit[63:0] i;
  bit[15:0] k = '1;
  bit[15:0] m = 16'hffff;
  
  $display("j=%64b", j);
  
  i = ~j;
  $display("i = %64b", i);
  
  $display("%64b", ~64'h0);
  
  $display("%0h", k);
  
  $display("%0b", k != m);
  
  i[8:0] = '0;
  $display("i = %64b", i);
  
  i = '0;
  $display("i = %64b", i);
  
  i = '1;
  $display("i = %64b", i);
end
endprogram

/// vcs -R -sverilog all_bits_one.sv
/// simv - l run.log
