/* lab_08_p1.sv */

module lab_08_p1 (
    input logic clk, reset,
    output logic [31:0] pc,

    input logic        pc_update,
    input logic [31:0] pc_new
);

logic [31:0] pc1;

always_ff @(posedge clk) begin
if(!reset)
pc <= pc1;
else
pc <= 32'b0;
end


always_comb
begin
    if(pc_update)
    pc1 = pc_new;
    else
    pc1 = pc + 4;
end

endmodule
