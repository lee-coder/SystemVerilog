function void gen_pn11_bit_data(ref bit[10:0] pn11_init_data,
                                input int length,
                                ref bit data[]);
  if(pn11_init_data == 0) begin
    pn11_init_data = 'h7ff;
  end
  if(data.size > length) begin
    $display("Warning! Do you really want to do this?");
  end
  else begin
    data = new[length](data);
  end
  for(int i=0; i<length; i++) begin
    data[i] = pn11_init_data[10];
    pn11_init_data = {pn11_init_data[9:0], (pn11_init_data[10] ^ pn11_init_data[8])};
  end                                                              
endfunction: gen_pn11_bit_data

function void pn11_data_bit_check(ref bit pn11_is_sync,
                                  ref bit[10:0] pn11_init_data,
                                  ref bit data[]);
  bit vr_pn11_bit;
  if(pn11_is_sync == 0) begin
    pn11_init_data = {>>{data[0:10]}};
  end
  if(pn11_init_data == 0) begin
    pn11_is_sync = 0;
    return;
  end
  foreach(data[i]) begin
    vr_pn11_bit = pn11_init_data[10];
    pn11_init_data = {pn11_init_data[9:0], (pn11_init_data[10] ^ pn11_init_data[8])};
    if(data[i] != vr_pn11_bit) begin
      pn11_is_sync = 0;
      return;
    end
  end
  pn11_is_sync = 1;
endfunction: pn11_data_bit_check
