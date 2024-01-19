module A_Input_Register

(

input logic [7:0] SB,
input logic O_ADD,
input logic SB_ADD,
output logic [7:0] out,

input logic clk,
input logic reset
);

logic [7:0] reg_input;
logic reg_enable;

always_comb
begin
    if(SB_ADD == 1'b1) begin
        reg_enable = 1'b1;
        reg_input = SB;
    end else if(O_ADD == 1'b1) begin
        reg_enable = 1'b1;
        reg_input = 8'b00000000;
    end else begin
        reg_enable = 1'b0;
        reg_input = 8'b00000000;
    end

end

//register A_INPUT_REG #(.WIDTH(8));
register A_INPUT_REG (.in(reg_input), .out(out), .clk(clk), .enable(reg_enable), .reset(reset));
endmodule;