module tb_hc_enc;

    // Testbench signals
    logic [3:0] i_data;
    logic [7:1] o_enc_data;

    // Instantiate the Device Under Test (DUT)
    hc_enc dut (
        .i_data(i_data),
        .o_enc_data(o_enc_data)
    );

    // Task to display the results
    task display_results;
        $display("i_data = %b, o_enc_data = %b", i_data, o_enc_data);
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

