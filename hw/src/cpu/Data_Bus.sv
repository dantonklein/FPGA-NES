module Data_Bus
(
    input logic P_DB,
    input logic [7:0] Processor_Status_Register_Out,

    input logic SB_DB,
    input logic [7:0] Special_Bus_Out,

    input logic PCH_DB,
    input logic [7:0] Program_Counter_High_Register_Out,

    input logic PCL_DB,
    input logic [7:0] Program_Counter_Low_Register_Out,

    input logic DL_DB,
    input logic [7:0] Input_Data_Latch_Out,
    
    input logic AC_DB,
    input logic [7:0] Accumulator_Out,

    output logic [7:0] DB
);

    always_comb begin
        if(P_DB == 1'b1) begin
            DB = Processor_Status_Register_Out;
        end else if(SB_DB == 1'b1) begin
            DB = Special_Bus_Out;
        end else if(PCH_DB == 1'b1) begin
            DB = Program_Counter_High_Register_Out;
        end else if(PCL_DB == 1'b1) begin
            DB = Processor_Status_Register_Out;
        end else if(DL_DB == 1'b1) begin
            DB = Input_Data_Latch_Out;
        end else if(AC_DB == 1'b1) begin
            DB = Accumulator_Out;
            
        end else begin
            DB = 8'b00000000;
        end
    end



endmodule