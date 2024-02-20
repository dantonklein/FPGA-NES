module Address_High_Bus
(
    input logic Zero_ADH0,
    input logic Zero_ADH1_7,

    input logic SB_ADH,
    input logic [7:0] Special_Bus_Out,

    input logic PCH_ADH,
    input logic [7:0] Program_Counter_High_Register_Out,

    input DL_ADH
    input logic [7:0] Input_Data_Latch_Out,

    output logic [7:0] ADH
);

logic [6:0] ADH1_7;
logic ADH0;

    always_comb begin
        if(PCH_ADH == 1'b1) begin
            ADH1_7 = Program_Counter_High_Register_Out[7:1];
            ADH0 = Program_Counter_High_Register_Out[0];
        end else if(SB_ADH == 1'b1) begin
            ADH1_7 = Special_Bus_Out[7:1];
            ADH0 = Special_Bus_Out[0];
        end else if(DL_ADH == 1'b1) begin
            ADH1_7 = Input_Data_Latch_Out[7:1];
            ADH0 = Input_Data_Latch_Out[0];
        end else begin
            ADH1_7 = 7'b0000000;
            ADH0 = 1'b0;
        end

        if(Zero_ADH0 == 1'b1) begin
            ADH0 = 1'b0;
        end

        if(Zero_ADH1_7 == 1'b1) begin
            ADH1_7 = 7'b0000000;
        end

        ADH = {ADH1_7,ADH0};
    end



endmodule