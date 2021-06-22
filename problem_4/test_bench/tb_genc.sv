/* tb_genc.sv */
`timescale 1ns/1ps

module tb_genc();

logic clk,reset;
logic [31:0] pc;
logic [31:0] komut;
logic [31:0] mem [0:63];
logic        hata;
assign komut = mem[pc >> 2];

genc genc_i7(.clk(clk),.reset(reset),.komut(komut),.pc(pc),.hata(hata));

always
begin
clk = 0; #12; clk = 1; #12;
end

initial begin
$readmemb("fib20.mem",mem);
end

initial begin
reset = 0; #10; reset = 1;
end

initial begin
#10000;
$stop;
end

endmodule
