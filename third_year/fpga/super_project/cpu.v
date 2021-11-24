module cpu (
    input  clk,
    input  rst,
    input  [31:0] IN,
    output [31:0] OUT
);

    wire [31:0] SE;
    wire [31:0] Instr;
    wire [31:0] ch1, ch2, res;
    reg  [31:0] write_data;
    reg  [7:0]  PC = 0;
    wire        flag;

    assign OUT = ch1;

    instruction_memory  im(.A(PC),
                           .RD(Instr)
                           );

    register_file rf(.CLK(clk),
                     .WE3(Instr[29] | Instr[28]),
                     .A1(Instr[22:18]),
                     .A2(Instr[17:13]),
                     .A3(Instr[4:0]),
                     .RD1(ch1),
                     .RD2(ch2),
                     .WD3(write_data)
                     );

    ALU ariphmetic_logic(
                         .ALUOp(Instr[27:23]),
                         .A(ch1),
                         .B(ch2),
                         .Result(res),
                         .Flag(flag)
                         );

    assign SE = {Instr[27],Instr[27],Instr[27],Instr[27],Instr[27],Instr[27],Instr[27],Instr[27],Instr[27],Instr[27:5]};
    always @(*) begin
        case (Instr[29:28])
            2'd1: write_data <= IN;
            2'd2: write_data <= SE;
            2'd3: write_data <= res;
        endcase
    end

    always @(posedge clk) begin
        if ((flag & Instr[30]) | Instr[31]) PC <= PC + Instr[12:5];
        else PC <= PC + 8'b00000001;
        if (rst == 0) PC <= 0;
    end

endmodule
