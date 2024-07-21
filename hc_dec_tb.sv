module tb_hc_decode;

    // Testbench signals
    logic [7:1] i_enc_data;
    logic [4:1] o_dec_data;
    logic o_err_flag;

    // Instantiate the Device Under Test (DUT)
    hc_decode dut (
        .i_enc_data(i_enc_data),
        .o_dec_data(o_dec_data),
        .o_err_flag(o_err_flag)
    );

    // Task to display the results
    task display_results;
        $display("i_enc_data = %b, o_dec_data = %b, o_err_flag = %b", i_enc_data, o_dec_data, o_err_flag);
    endtask

    initial begin
        // Test case 1: No error
        i_enc_data = 7'b0110111; // Encoded data with no error
        #10;
        display_results();

        // Test case 2: Single bit error in data
        i_enc_data = 7'b0110011; // Error in one bit
        #10;
        display_results();

        // Test case 3: Single bit error in check bits
        i_enc_data = 7'b0110110; // Error in one check bit
        #10;
        display_results();

        // Test case 4: Another single bit error
        i_enc_data = 7'b0010111; // Another error in data
        #10;
        display_results();

        // Test case 5: Multiple errors (should not correct)
        i_enc_data = 7'b0000000; // Multiple bit errors
        #10;
        display_results();

        // End the simulation
        $stop;
    end

endmodule

