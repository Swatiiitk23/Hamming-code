module hc_combined(
    input logic [3:0] i_data,
    output logic [4:1] o_dec_data,
    output logic o_err_flag
);

logic [7:1] enc_data;

// Instantiate the Encoder
hc_enc encoder (
    .i_data(i_data),
    .o_enc_data(enc_data)
);

// Instantiate the Decoder
hc_decode decoder (
    .i_enc_data(enc_data),
    .o_dec_data(o_dec_data),
    .o_err_flag(o_err_flag)
);

endmodule

