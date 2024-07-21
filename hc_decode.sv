module hc_decode (
input logic [7:1] i_enc_data,
output logic [4:1] o_dec_data,
output logic o_err_flag
);

logic [2:0] chk_bit_cmp;
logic [2:0] chk_bit_ext;
logic [2:0] err_pos;
logic [7:1]corr_packet;


always_comb begin
   chk_bit_ext[0]=i_enc_data[1];
   chk_bit_ext[1]=i_enc_data[2];
   chk_bit_ext[2]=i_enc_data[4];
   chk_bit_cmp[0]=i_enc_data[3]^i_enc_data[5]^i_enc_data[7];
   chk_bit_cmp[1]=i_enc_data[3]^i_enc_data[6]^i_enc_data[7];
   chk_bit_cmp[2]=i_enc_data[5]^i_enc_data[6]^i_enc_data[7];
   
   err_pos[2]=chk_bit_ext[2]^chk_bit_cmp[2];
   err_pos[1]=chk_bit_ext[1]^chk_bit_cmp[1];
   err_pos[0]=chk_bit_ext[0]^chk_bit_cmp[0];
   corr_packet=i_enc_data;
   o_err_flag=|err_pos;
   //o_err_flag=err_pos[0]|err_pos[1]|err_pos[2];
   if(err_pos!=3'b000)begin
       corr_packet[err_pos]=~corr_packet[err_pos];
   end
   o_dec_data = {corr_packet[7], corr_packet[6], corr_packet[5], corr_packet[3]};

end
endmodule
