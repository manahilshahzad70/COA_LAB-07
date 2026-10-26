# COA_LAB-07

# Computer Architecture Lab

## Lab 07 – Implementation of Arithmetic Logic Unit (ALU)

### Lab Description

The purpose of this lab was to understand the design and implementation of Arithmetic Logic Units (ALUs) using Verilog HDL and Logisim. Different ALU designs were implemented and simulated to understand arithmetic operations, logical operations, comparison, shifting, carry generation, and status flags. The designs were tested using Verilog testbenches and ModelSim waveforms.

The tasks implemented in this lab were:

1. Design and Simulation of a 1-bit ALU
2. Design and Simulation of a 4-bit ALU
3. Implementation of a Parameterized ALU
4. Design and Verification of a 32-bit ALU
5. Simulation of a 32-bit ALU Using Logisim

### Task 1 – Design and Simulation of a 1-bit ALU

A 1-bit ALU was designed using Verilog HDL with dataflow, structural, and behavioral modeling. It performs AND, OR, addition, and subtraction operations based on the selection inputs. The design includes carry-in, carry-out, and a control input for subtraction. A testbench was used to test different input combinations, and the results were verified through ModelSim simulation. A truth table and circuit diagram were also created using Logisim.

### Task 2 – Design and Simulation of a 4-bit ALU

A 4-bit ALU was implemented using four interconnected 1-bit ALUs. The design supports AND, OR, addition, subtraction, and Set Less Than (SLT) operations. Status flags, including Carry Flag (CF), Sign Flag (SF), Zero Flag (ZF), and Overflow Flag (OF), were implemented to indicate different conditions of the result. A testbench was used to apply different input values and verify the operations and status flags through simulation.

### Task 3 – Implementation of a Parameterized ALU

A parameterized ALU was designed using Verilog HDL to support different input and output bit-widths. The parameter `N` determines the width of the operands and result, making the design reusable for different data sizes. The ALU supports addition, subtraction, AND, OR, NOT, and XOR operations. A control signal selects the required operation, while the carry-out and zero flags provide additional information about the result. The functionality was tested using a testbench in ModelSim.

### Task 4 – Design and Verification of a 32-bit ALU

A 32-bit ALU was designed using Verilog HDL to perform arithmetic, logical, comparison, and shifting operations commonly used in RISC-V processors. The ALU supports ADD, SUB, AND, OR, XOR, signed SLT, unsigned SLTU, logical left shift (SLL), logical right shift (SRL), and arithmetic right shift (SRA). A 4-bit control signal selects the operation, and a zero flag indicates whether the result is zero. A testbench with multiple test cases was used to verify the expected results.

### Task 5 – Simulation of a 32-bit ALU Using Logisim

The 32-bit ALU designed in Task 4 was implemented and simulated using Logisim-evolution. The circuit uses two 32-bit inputs and a 4-bit control signal to select between the supported arithmetic, logical, comparison, and shifting operations. Different input combinations were applied to verify the output results and zero flag. The circuit outputs were compared with the expected results to check the functionality of the ALU.

### Software Used

- ModelSim
- Logisim

### Conclusion

This lab provided practical experience in designing and simulating ALUs of different bit-widths using Verilog HDL and Logisim-evolution. It helped develop an understanding of arithmetic and logical operations, structural and behavioral modeling, parameterized designs, comparison and shifting operations, and status flags. The implementation of a 32-bit ALU also demonstrated how these operations are combined in a processor to perform computations and support instruction execution.

