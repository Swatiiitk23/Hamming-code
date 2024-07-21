                                               Hamming Code Error Correction System


This project implements a complete Hamming Code-based error correction system in SystemVerilog, designed to handle and correct single-bit errors during data transmission. The project utilizes Hamming Code for error correction in data transmission. The system starts with a 4-bit input data value, which is encoded into a 7-bit Hamming code by adding 3 parity bits using the hc_enc module. These parity bits are computed with XOR operations on specific combinations of the input bits: C0 = I0 XOR I1 XOR I3, C1 = I0 XOR I2 XOR I3, and C2 = I1 XOR I2 XOR I3. This encoded 7-bit data is then ready for transmission.

During transmission, noise or errors may corrupt the 7-bit encoded data. The hc_decode module receives this potentially corrupted data, calculates expected parity bits, and compares them to the received parity bits. It computes an error syndrome to detect any discrepancies and determine the position of any single-bit errors. If errors are detected, the module corrects the erroneous bit and then decodes the corrected 7-bit data back into the original 4-bit data. An error flag is also set to indicate whether a correction was made.

The system consists of three main modules:
Encoder (hc_enc.sv): Converts 4-bit input data into a 7-bit Hamming code by adding 3 parity bits, calculated through XOR operations. This encoding ensures data integrity by adding redundancy for error detection and correction.

Decoder (hc_decode.sv): Receives the 7-bit encoded data, detects any single-bit errors using the parity bits, and corrects them. It then decodes the corrected 7-bit data back into the original 4-bit data, with an error flag indicating whether a correction was made.
This project showcases a robust solution for error detection and correction in data transmission systems, ensuring reliable communication even in the presence of noise.

For detailed implementation and usage, please refer to the source files and testbenches in this repository.
