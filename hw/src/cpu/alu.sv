// Danton Klein, Anthony Stross
// This is the ALU for the Ricoh RP2A03 CPU that is utilized by the NES. The CPU is indentical to the MOS 6502 but without BCD capabilities and with the NES' audio chip. 

module RP2A03_ALU 
    (
        input logic [7:0] A,                    //input from A INPUT Register
        input logic [7:0] B,                    //input from B INPUT Register
        input logic CARRY_IN,                   //Carry_in for addition
        input logic SUMS, ANDS, EORS, ORS, SRS, //enable signals for operations
        output logic [7:0] OUT,                 //operations output
        output logic CARRY, OVERFLOW            //CPU status flags for carry and overflow
    );

    logic RES [7:0];

    always_comb begin
        CARRY = 1'b0;
        OVERFLOW = 1'b0;
        OUT = 8'h00;
        
        if(SUMS == 1'b1) begin
            {CARRY,RES} = A + B + CARRY_IN;
            OVERFLOW = ((A[7] && B[7] && !RES[7]) || (!A[7] && !B[7] && RES[7]));
        end
        else if(ANDS == 1'b1) begin
            RES = A & B;
        end
        else if(EORS == 1'b1) begin
            RES = A ^ B;
        end
        else if(ORS == 1'b1) begin
            RES = A | B;
        end
        else if(SRS == 1'b1) begin
            {RES,CARRY} = {A,0} >> 1;
        end
    end

    assign OUT = RES;

endmodule
