module B_Input_Register

(

input logic [7:0] DB,
input logic [7:0] ADL,

input logic NOT_DB_ADD,
input logic DB_ADD,
input logic ADL_ADD,

output logic [7:0] out,

input logic clk,
input logic reset
);

logic [7:0] reg_input;
logic reg_enable;

always_comb
begin
    if(NOT_DB_ADD == 1'b1) begin
        reg_enable = 1'b1;
        reg_input = ~DB;
    end else if(DB_ADD == 1'b1) begin
        reg_enable = 1'b1;
        reg_input = DB;
    end else if(ADL_ADD == 1'b1) begin
        reg_enable = 1'b1;
        reg_input = ADL;
    end else begin
        reg_enable = 1'b0;
        reg_input = 8'b00000000;
    end

end

//register B_INPUT_REG #(.WIDTH(8));
register B_INPUT_REG (.in(reg_input), .out(out), .clk(clk), .enable(reg_enable), .reset(reset));
endmodule;