module pipeline_cpu (
    input clk
);

    reg [3:0] opcode_IF, op1_IF, op2_IF;
    reg [3:0] opcode_ID, op1_ID, op2_ID;
    reg [3:0] opcode_EX, op1_EX, op2_EX;
    reg [7:0] result_WB;

    integer pc = 0;

    reg [11:0] instr_mem [0:2];

    initial begin
        instr_mem[0] = {4'd1, 4'd5, 4'd3}; // ADD 5 + 3
        instr_mem[1] = {4'd2, 4'd9, 4'd4}; // SUB 9 - 4
        instr_mem[2] = {4'd1, 4'd2, 4'd6}; // ADD 2 + 6
    end

    always @(posedge clk) begin
        {opcode_IF, op1_IF, op2_IF} <= instr_mem[pc];
        pc <= pc + 1;

        opcode_ID <= opcode_IF;
        op1_ID <= op1_IF;
        op2_ID <= op2_IF;

        opcode_EX <= opcode_ID;
        op1_EX <= op1_ID;
        op2_EX <= op2_ID;

        case (opcode_EX)
            4'd1: result_WB <= op1_EX + op2_EX;
            4'd2: result_WB <= op1_EX - op2_EX;
            default: result_WB <= 0;
        endcase
    end

endmodule
