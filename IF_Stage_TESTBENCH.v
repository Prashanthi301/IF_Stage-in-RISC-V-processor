module RISC_V_Pipeline_tb();

    reg clk;
    reg reset;

    // Signals for the IF stage
    wire [31:0] instruction;
    wire [31:0] pc;

    // Signals for ID stage
    wire [31:0] id_instruction;
    wire [31:0] id_pc;

    // Signals for EX stage
    wire [31:0] ex_pc;
    wire [31:0] ex_result;

    // Signals for MEM stage
    wire [31:0] mem_result;

    // Signals for WB stage
    wire [31:0] wb_data;

    // Instantiate the IF stage
    IF_Stage if_stage (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .pc(pc)
    );

    // Instruction Decode (ID) stage
    ID_Stage id_stage (
        .clk(clk),
        .reset(reset),
        .instruction_in(instruction),
        .pc_in(pc),
        .instruction_out(id_instruction),
        .pc_out(id_pc)
    );

    // Execute (EX) stage
    EX_Stage ex_stage (
        .clk(clk),
        .reset(reset),
        .pc_in(id_pc),
        .instruction_in(id_instruction),
        .result_out(ex_result),
        .pc_out(ex_pc)
    );

    // Memory Access (MEM) stage
    MEM_Stage mem_stage (
        .clk(clk),
        .reset(reset),
        .data_in(ex_result),
        .data_out(mem_result)
    );

    // Write Back (WB) stage
    WB_Stage wb_stage (
        .clk(clk),
        .reset(reset),
        .data_in(mem_result),
        .data_out(wb_data)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        reset = 1;           // Apply reset
        #10 reset = 0;       // Release reset
        
        // Optional: You can add more stimulus here for a program
        #200;                // Run simulation for 200 time units
        $stop;               // Stop simulation
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t | IF: PC = %h, Instruction = %h | ID: PC = %h, Instruction = %h | EX: PC = %h, Result = %h | MEM: Result = %h | WB: Data = %h",
                 $time, pc, instruction, id_pc, id_instruction, ex_pc, ex_result, mem_result, wb_data);
    end

endmodule

