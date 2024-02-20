module Address_Low_Bus
(
    input logic DL_ADL,
    input logic [7:0] Input_Data_Latch_Out,

    input logic PCL_ADL,
    input logic [7:0] Program_Counter_Low_Register_Out,

    input logic Zero_ADL0,
    input logic Zero_ADL1,
    input logic Zero_ADL2,

    input logic S_ADL,
    input logic [7:0] Stack_Pointer_Register_Out_Register_Out,

    input logic ADD_ADL,
    input logic [7:0] Adder_Hold_Register_Out,

    output logic [7:0] ADL
);

    logic [7:0] Output;
    //logic [2:0] zeroing;

    assign zeroing = {Zero_ADL2,Zero_ADL1,Zero_ADL0};

    always_comb begin
        if(DL_ADL == 1'b1) begin
            Output = Input_Data_Latch_Out;
        end else if(PCL_ADL == 1'b1) begin
            Output = Special_Bus_Out;
        end else if(S_ADL == 1'b1) begin
            Output = Stack_Pointer_Register_Out_Register_Out;
        end else if(ADD_ADL == 1'b1) begin
            Output = Adder_Hold_Register_Out;
            
        end else begin
            Output = 8'b00000000;
        end

        if(zeroing == 3'b000) begin
            ADL = Output;
        end else if(zeroing == 3'b001) begin
            ADL = {Output[7:1],1'b0};
        end else if(zeroing == 3'b010) begin
            ADL = {Output[7:2],1'b0,Output[0]};
        end else if(zeroing == 3'b011) begin
            ADL = {Output[7:2],2'b00};
        end else if(zeroing == 3'b100) begin
            ADL = {Output[7:3],1'b0,Output[1:0]};
        end else if(zeroing == 3'b101) begin
            ADL = {Output[7:3],1'b0,Output[1],1'b0};
        end else if(zeroing == 3'b110) begin
            ADL = {Output[7:3],2'b00,Output[0]};
        end else if(zeroing == 3'b111) begin
            ADL = {Output[7:3],3'b000};
        end
    end




endmodule