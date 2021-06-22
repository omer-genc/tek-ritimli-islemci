/* fmax_genc.sv */

module fmax_genc(
    input   logic            clk,reset,
    input   logic   [31:0]   komut, // decode yani lab_07_p3 e bağlanacak
    output  logic   [31:0]   pc,    //Fetch e bağlanacak yani lab_08_p1
    output  logic            hata   // Fetch e bağlanacak
);

logic            hata_reg;
logic   [31:0]   komut_reg;
logic   [31:0]   pc_reg;   

genc gencfmax(.clk(clk),.reset(reset),.komut(komut_reg),.pc(pc_reg),.hata(hata_reg));

always_ff @(posedge clk) begin
komut_reg <= komut;
pc   <= pc_reg;
hata <= hata_reg;
end

endmodule
