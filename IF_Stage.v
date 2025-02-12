module IF_Stage(
    input wire clk,
    input wire reset,
    output wire [31:0] instruction, // Fetched instruction
    output wire [31:0] pc           // Current PC value
);

    wire [31:0] pc_out;

    ProgramCounter pc_module (
        .clk(clk),
        .reset(reset),
        .pc(pc_out)
    );

    InstructionMemory imem (
        .addr(pc_out),
        .instruction(instruction)
    );

    assign pc = pc_out; // Forward PC output

endmodule
