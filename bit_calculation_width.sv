typedef bit[1:0] double_bit;
program automatic bit_cal_width()；
initial begin
  bit[1:0] dif[4] = '{2'b00,2'b01,2'b10,2'b11};
  foreach(dif[i]) begin
    $display("dif[%0d] = %0b", i, dif[i]);
    $display("result[%0d] = %0b", i, (double_bit'(dif[i] + 2'b10) + 3'b001));
    $display("result[%0d] = %0b", i, (dif[i] + 2'b10 + 3'b001));  /// pay attention to the difference with line above.
    $display("result[%0d] = %0b", i, ((dif[i] + 2'b10) + 3'b001));  /// same with no brackets line above.
  end
end
endprogram
