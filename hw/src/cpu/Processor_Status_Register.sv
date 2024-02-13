module Processor_Status_Register

(
    input logic clk,
    input logic reset,
    input logic ACR,
    input logic AVR,
    input logic IR5,
    input logic[7:0] DB,

    input logic DB0_C,
    input logic IR5_C,
    input logic ACR_C,
    input logic DB1_Z,
    input logic DBZ_Z,
    input logic DB2_I,
    input logic IR5_I,
    input logic DB3_D,
    input logic IR5_D,
    input logic DB6_V,
    input logic AVR_V,
    input logic ONE_V,
    input logic DB7_N,
    
    output logic[7:0] DB_out

);

logic DBZ;
logic C, Z, I, D, B, V, N;

assign DBZ = ~(DB[7] | DB[6] | DB[5] | DB[4] | DB[3] | DB[2] | DB[1] | DB[0]);

always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
        C <= 1'b0;
        Z <= 1'b0;
        I <= 1'b0;
        D <= 1'b0;
        B <= 1'b1;
        V <= 1'b0;
        N <= 1'b0;
    end
    else begin
        if(DB0_C == 1'b1) begin
            C <= DB[0];
        end else if (IR5_C == 1'b1) begin
            C <= IR5;
        end else if (ACR_C == 1'b1) begin
            C <= ACR;
        end 

        if (DB1_Z == 1'b1) begin
            Z <= DB[1];
        end else if (DBZ_Z == 1'b1) begin
            Z <= DBZ;
        end 

        if (DB2_1 == 1'b1) begin
            I <= DB[2];
        end else if (IR5_1 == 1'b1) begin
            I <= IR5;
        end 

        if (DB3_D == 1'b1) begin
            D <= DB[3];
        end else if (IR5_D == 1'b1) begin
            D <= IR5;
        end

        if (DB6_V == 1'b1) begin
            V <= DB[6];
        end else if (AVR_V == 1'b1) begin
            V <= AVR;
        end else if (ONE_V == 1'b1) begin
            V <= 1'b1;
        end

        if (DB7_N == 1'b1) begin
            N <= DB[7];
        end
    end
end

endmodule;