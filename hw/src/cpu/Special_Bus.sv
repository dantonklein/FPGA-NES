module Special_Bus
(
    input logic X_SB,
    input logic [7:0] X_Index_Register_Out,

    input logic Y_SB,
    input logic [7:0] Y_Index_Register_Out,

    input logic S_SB,
    input logic [7:0] Stack_Pointer_Register_Out,
    
    input logic AC_SB,
    input logic [7:0] Accumulator_Out,

    // ADDER HOLD REGISTER, THIS WILL CHANGE
    input logic ADD_SB_0_6,
    input logic ADD_SB_7,
    input logic [7:0] Adder_Hold_Register_Out,

    output logic [7:0] SB
);

    always_comb begin
        if(X_SB == 1'b1) begin
            SB = X_Index_Register_Out;
        end else if(Y_SB == 1'b1) begin
            SB = Y_Index_Register_Out;
        end else if(S_SB == 1'b1) begin
            SB = Stack_Pointer_Register_Out;
        end else if(AC_SB == 1'b1) begin
            SB = Accumulator_Out;
        end else if(ADD_SB_0_6 == 1'b1) begin // FIXME
            SB = {1'b0,Adder_Hold_Register_Out[6:0]};
        end else if(ADD_SB_7 == 1'b1) begin  // FIXME
            SB = {Adder_Hold_Register_Out[7],7'b0000000};
        end else begin
            SB = 8'b00000000;
        end
    end



endmodule