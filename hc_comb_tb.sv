module tb_hc_combined;

    // Testbench signals
    logic [3:0] i_data;
    logic [4:1] o_dec_data;
    logic o_err_flag;

    // Instantiate the combined Encoder and Decoder
    hc_combined dut (
        .i_data(i_data),
        .o_dec_data(o_dec_data),
        .o_err_flag(o_err_flag)
    );

    // Task to display the results
    task display_results;
        $display("i_data = %b, o_dec_data = %b, o_err_flag = %b", i_data, o_dec_data, o_err_flag);
    endtask

    initial begin
        // Test case 1
        i_data = 4'b0000; // No data, should still have valid check bits
        #10;
        display_results();

        // Test case 2
        i_data = 4'b0001;
        #10;
        display_results();

        // Test case 3
        i_data = 4'b0010;
        #10;
        display_results();

        // Test case 4
        i_data = 4'b0100;
        #10;
        display_results();

        // Test case 5
        i_data = 4'b1000;
        #10;
        display_results();

        // Test case 6
        i_data = 4'b1111; // All data bits set
        #10;
        display_results();

        // Test case 7
        i_data = 4'b1010;
        #10;
        display_results();

        // Test case 8
        i_data = 4'b0110;
        #10;
        display_results();

        // End the simulation
        $stop;
    end

endmodule

