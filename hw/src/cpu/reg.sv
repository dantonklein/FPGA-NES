// Register code used for the FPGA NES Project by Danton Klein and Anthony Stross

module register 
#(
    parameter WIDTH = 8
)
(
    input logic [WIDTH-1:0] in,
    output logic [WIDTH-1:0] out,
    
    input logic clk,
    input logic enable,
    input logic reset
);

always_ff @(posedge clk or posedge reset) begin

    if (reset)
        out <= '0;
    else if(enable)
        out <= in;
end

endmodule
