//Danton Klein, Anthony Stross
//This code is modified code from the SystemVerilog tutorial provided to us by one of our professors, Gregory Stitt. 

`timescale 1 ns / 100 ps

// Module: alu_tb
// Description: Testbench for alu module.

module alu_tb;

   localparam NUM_TESTS = 10000;   
   localparam WIDTH = 8;   
   logic [WIDTH-1:0] A, B, OUT;
   logic CARRY_IN;
   logic SUMS, ANDS, EORS, ORS, SRS;
   logic CARRY, OVERFLOW;
   logic [WIDTH-1:0] correct_out;
   logic correct_carry;
   logic correct_overflow;
   int encoded_select;
   
   RP2A03_ALU DUT (.*);

   // Function to check the status flags
   function void check_flags();
      // Check carry flag.
      if (correct_carry != CARRY)
        $display("ERROR (time %0t): Carry = %b instead of %b.", $realtime, CARRY, correct_carry);

      // Check overflow flag.
      if (correct_overflow != OVERFLOW)
        $display("ERROR (time %0t): Overflow = %b instead of %b.", $realtime, OVERFLOW, correct_overflow);
   endfunction
       
   initial begin
      $timeformat(-9, 0, " ns");
      // Test NUM_TESTS random inputs and select values.
      for (int i=0; i < NUM_TESTS; i++) begin
         A = $random;
         B = $random;
         CARRY_IN = $random;
         encoded_select = i % 5;
         SUMS = 1'b0;
         ANDS = 1'b0;
         EORS = 1'b0;
         ORS  = 1'b0;
         SRS  = 1'b0;
         correct_overflow = 1'b0;
         correct_carry = 1'b0;
         if (encoded_select == 0) begin
            SUMS = 1'b1;
            #10;
            {correct_carry, correct_out} = A + B + CARRY_IN;
            correct_overflow = ((A[7] && B[7] && !correct_out[7]) || (!A[7] && !B[7] && correct_out[7]));
         end

        else if (encoded_select == 1) begin
            ANDS = 1'b1;
            #10;
            correct_out = A & B;
         end
        
        else if (encoded_select == 2) begin
            EORS = 1'b1;
            #10;
            correct_out = A ^ B;
         end

        else if (encoded_select == 3) begin
            ORS = 1'b1;
            #10;
            correct_out = A | B;
         end

        else if (encoded_select == 4) begin
            SRS = 1'b1;
            #10;
            {correct_out,correct_carry} = {A,0} >> 1;
         end

         if (OUT != correct_out)
              $display("ERROR (time %0t): OUT = %h instead of %h.", $realtime, OUT, correct_out);

         if (encoded_select == 0 || encoded_select == 4) check_flags();        
      end 

      $display("Tests completed.");      
   end           
endmodule