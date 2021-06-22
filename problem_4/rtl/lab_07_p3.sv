/* lab_07_p3 */

module lab_07_p3(
    input  logic            clk,reset,
    input  logic   [31:0]   komut,

    output logic    [6:0]   opcode,
    output logic    [3:0]   aluop,

    output logic   [31:0]   rs1_data, rs2_data, imm, //rs1_data rs2_data p2
    output logic            hata,

    //yazma

    input logic we, //p2 we
    input logic [31:0] rd_data //p2 wbdata
);

logic [4:0] rd_kablo;
logic [4:0] rs1_kablo;
logic [4:0] rs2_kablo;


lab_07_p1 inst0(.komut(komut), .rd(rd_kablo), .rs1(rs1_kablo), .rs2(rs2_kablo),
.opcode(opcode), .aluop(aluop), .imm(imm), .hata(hata));

lab_07_p2 inst1(.clk(clk), .reset(reset), .we(we), .wbdata(rd_data),
.waddr(rd_kablo), .rs1(rs1_kablo), .rs2(rs2_kablo),.rs1_data(rs1_data),
.rs2_data(rs2_data));



endmodule

