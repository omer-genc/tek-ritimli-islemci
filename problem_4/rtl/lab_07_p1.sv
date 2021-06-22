/* lab_07_p1.sv */


module lab_07_p1(
    input  logic   [31:0]   komut,

    output logic    [6:0]   opcode,
    output logic    [3:0]   aluop,
    output logic    [4:0]   rs1, rs2, rd,
    output logic   [31:0]   imm,
    output logic            hata
);
parameter R = 7'b0000001;
parameter I = 7'b0000011;
parameter U = 7'b0000111;
parameter B = 7'b0001111;
logic [3:0] funct;
logic [6:0] code;
assign opcode = komut [6:0];
assign aluop   = funct;

always_comb begin
    case(opcode)
        R:
            begin
            rd      = komut [11: 7];
            rs1     = komut [19:15];
            rs2     = komut [24:20];
            imm     = 32'b0;
            {funct[3],funct[2:0]}   = {komut[30],komut [14:12]};

            hata      = 1'b0;
            end

        I:
            begin
            rd       = komut [11: 7] ;
            rs1      = komut [19:15] ;
            imm      = {20'b0,  komut [31:20]};
            {funct[3],funct [2:0]}    = {1'b0,komut[14:12]};


            rs2       = 5'b0;
            hata      = 1'b0;
            end

        U:
            begin
            rd        = komut [11: 7];
            imm       = komut [31:12];

            funct     = 4'b0;
            rs1       = 5'b0;
            rs2       = 5'b0;
            hata      = 1'b0;
            end

        B:
            begin
            {funct[3],funct [2:0]}       = {1'b0,komut[14:12]};
            rs1         = komut [19:15];
            rs2         = komut [24:20];
            imm         = {18'b0,komut [31:25],komut [11:7],1'b0};
            rd          = 5'b0;
            hata        = 1'b0;
            end
    default:
            begin
            funct       = 4'b0;
            rs1         = 5'b0;
            rs2         = 5'b0;
            imm         = 32'b0;
            rd          = 5'b0;
            hata        = 1'b1;
			end
endcase
end
endmodule

