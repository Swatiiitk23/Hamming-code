module hc_enc(
input logic [3:0]i_data,
output logic [7:1] o_enc_data
);

logic [3:0]chk_bit;
logic [7:1]map_data;

always_comb begin
chk_bit[0]=i_data[0]^i_data[1]^i_data[3];
chk_bit[1]=i_data[0]^i_data[2]^i_data[3];
chk_bit[2]=i_data[1]^i_data[2]^i_data[3];
map_data[3]=i_data[0];
map_data[5]=i_data[1];
map_data[6]=i_data[2];
map_data[7]=i_data[3];
map_data[1]=chk_bit[0];
map_data[2]=chk_bit[1];
map_data[4]=chk_bit[2];
o_enc_data=map_data;
end
endmodule 