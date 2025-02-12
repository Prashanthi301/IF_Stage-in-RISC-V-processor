module ProgramCounter(
    input wire clk,
    input wire reset,
    output reg [31:0] pc
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 32'b0;           // Reset PC to zero
        else
            pc <= pc + 4;          // Increment PC by 4
    end

endmodule
