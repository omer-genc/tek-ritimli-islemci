/* lab_07_p2.sv */

module lab_07_p2(
    input logic clk,reset,

//yazma portları//
    input logic we,
    input logic [4:0] waddr,
    input logic [31:0] wbdata,

//okuma portları//
    input  logic [4:0] rs1,
    input  logic [4:0] rs2,
    output logic [31:0] rs1_data,
    output logic [31:0] rs2_data
);

logic [31:0] mem[0:12];
integer i;
always_ff @(posedge clk)
    if(!reset)
    for (i=0; i<13; i=i+1)
    mem[i] <= 32'b0;
    else if(we)
        mem[waddr] <= wbdata;

always_comb begin

    rs1_data = mem[rs1];
    rs2_data = mem[rs2];

end
endmodule
