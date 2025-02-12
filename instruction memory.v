module InstructionMemory(
    input wire [31:0] addr,        // Address input (from PC)
    output wire [31:0] instruction // 32-bit instruction output
);

    reg [31:0] memory [0:255];     // 256-word memory

    // Initialize memory with sample instructions
    initial begin
        memory[0] = 32'h00000013;  // Sample NOP instruction (add x0, x0, 0)
        memory[1] = 32'h0000001C;  // Another NOP for testing
	memory[2] = 32'h40B50533;  // SUB x10, x10, x11
        memory[3] = 32'h00052283;  // LW x5, 0(x10)
        memory[4] = 32'h00A52023;  // SW x10, 0(x10)
        memory[5] = 32'h0000006F;  // JAL x0, 0
        // Additional instructions can be added here
    end

// memory[0] :: addr[0]to addr[3]
//memory [1] :: addr[4] to addr[B]
    assign instruction = memory[addr[31:2]]; // Word-aligned access
always @(addr) begin
    $display("Time = %0t | Addr = %h | Instruction = %h", $time, addr, instruction);
end

endmodule
