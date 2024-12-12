# IF_Stage-in-RISC-V-processor
The RISC-V processor is an open-source, Reduced Instruction Set Computing (RISC) architecture developed for a wide range of applications, from embedded systems to high-performance computing. It is designed to be simple, modular, and highly extensible, providing flexibility for researchers and developers to customize and optimize for specific needs. The RISC-V architecture enables efficient instruction execution, making it suitable for high-performance, low-power, and cost-sensitive applications.The primary motivation for designing and studying the RISC-V processor architecture is its open-source nature, which makes it a cost-effective choice for various applications, allowing for unrestricted experimentation, education, and innovation. The modular instruction set provides a foundation for efficient hardware design, adaptability, and scalability, offering benefits in both commercial and research contexts. Furthermore, the RISC-V processor is designed to address the limitations of proprietary architectures, fostering a collaborative ecosystem for development.


## Here is the block diagram of pipeline structure of RISC-V processor
![image](https://github.com/user-attachments/assets/aeafb96f-0127-4e20-a928-bdfc19d68b43)


## The diagram for instruction fetch stage is as follows:

![image](https://github.com/user-attachments/assets/294c64c4-cbea-4715-94ad-8c56d49ab59d)


## Explanation of each component:
### 1. Program Counter(PC):
The PC holds the address of the next instruction to be fetched. At the start, it is initialized to 0 (or a specific starting address in some systems).In each clock cycle, the PC is incremented by 4 (in RISC-V, instructions are 4 bytes long), unless there is a branch or jump instruction that alters the flow. The PC value is used as an address input to the Instruction Memory.The PC value is updated after every instruction fetch, typically incrementing by 4 or being updated in case of branch or jump instructions.
### 2. Instruction Memory (IMEM):
IMEM stores the program code (instructions). It takes the current PC as the address and fetches the 32-bit instruction at that address. In the diagram, IMEM is represented as a memory unit where each address corresponds to a 32-bit instruction.The instruction is fetched from IMEM using the PC value as the address input.It outputs the fetched instruction to the Instruction Register (IR).
### 3. Instruction Register (IR):
The IR temporarily stores the instruction fetched from IMEM before it is passed to the next stage of the pipeline (Instruction Decode).The IR holds the 32-bit instruction that was fetched from memory. The fetched instruction from IMEM is placed in the IR for further processing in the next pipeline stages (ID, EX, MEM, WB)
### 4. PC Update Logic
This block handles the logic for updating the PC after each fetch. Typically, the PC is incremented by 4 to point to the next instruction. However, the PC update logic also handles branch/jump conditions, where the PC might not simply increment by 4. Instead, it could be updated based on branch or jump targets, calculated using the current instruction’s operands or immediate values. Normal Execution: For most instructions, the PC simply increments by 4 (PC = PC + 4).Branch/Jump Instructions: If the fetched instruction is a branch (e.g., BEQ, BNE, JAL), the PC might be updated with the target address of the branch, depending on the condition.



## Waveform Analysis:
### 1. Clk (Clock Signal):
The clock signal, labeled clk, is toggling with a period of 10 time units (5 units high, 5 units low). This is consistent with the clk toggle code in the testbench (forever #5 clk = ~clk;).Each positive edge of clk triggers the program counter (PC) update in the ProgramCounter module.
### 2. Reset:
The reset signal is initially high (set to 1) at the start of the simulation. After 10 time units, the reset goes low (set to 0), which allows the PC to start incrementing. During the initial reset period, the PC is held at zero.
### 3. PC (Program Counter):
After the reset signal goes low, the pc (or pc_out) begins incrementing by 4 on each positive clock edge, representing typical word-aligned instruction fetching in a RISC-V processor. This increment is observed in the waveform as the pc value changes to 4, 8, 12, and so on with each clock cycle. The timing diagram confirms that pc is incrementing by 4 after every positive edge of clk, as expected in a 32-bit RISC architecture.
### 4. Instruction:
The instruction signal outputs the 32-bit instruction fetched from instruction memory at the address specified by pc.Based on the sample instructions loaded in InstructionMemory, the values of instruction change according to the program counter’s address. Observing this waveform, we can see that each instruction is correctly fetched from memory as the pc advances.


## Timing Diagram Analysis (Each Cycle)
Cycle 1 (Reset = 1):reset is high, so pc is set to 0 and does not increment. The instruction shows the instruction at address 0 (likely the first instruction in memory).
Cycle 2 (Reset = 0, First Increment):reset goes low, allowing pc to increment on the next positive clock edge.At the next clock edge, pc increments to 4, and the instruction changes to reflect the instruction at this new address (likely the second instruction in memory).
Subsequent Cycles:On each positive edge of clk, pc increments by 4, and the instruction output updates according to the new address.
This confirms that the program counter and instruction memory are functioning correctly, with instructions being fetched sequentially.


