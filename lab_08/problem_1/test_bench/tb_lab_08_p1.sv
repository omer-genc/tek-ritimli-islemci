/* tb_lab_08_p1 */
`timescale 1ns/1ps

module tb_lab_08_p1();

logic clk,reset,pc_update;
logic [31:0] pc,pc_new;
logic [31:0] komut;
logic [31:0] mem [0:63];

assign komut = mem[pc >> 2];

lab_08_p1 uut0(.clk(clk),.reset(reset),.pc_update(pc_update),.pc_new(pc_new),.pc(pc));

always
begin
clk = 0; #5; clk = 1; #5;
end

initial begin
$readmemb("fib20.mem",mem);
end

initial begin
pc_new = 32'b0; #15; pc_new = 32'hAFA146E0; #15;
     pc_new = 32'h03A1D6E0; #15; pc_new = 32'b0;
end

initial begin
pc_update = 1; #60; pc_update = 0;
end

initial begin
reset = 1; #10; reset = 0;
end

initial begin
#1000;
$stop;
end

endmodule
