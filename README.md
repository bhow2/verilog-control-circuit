# Verilog ALU Control Circuit

This repository contains the implementation and testing of a control circuit using the Verilog hardware description language. The control circuit processes inputs by taking two 4-bit inputs and a 3-bit opcode, selecting the appropriate ALU module through a multiplexer based on the provided opcode. It includes various ALU functions like adders, multipliers, shifters, and more.

## Installation

Clone the repository to your local machine. 

```bash
git clone https://github.com/bhow2/verilog-control-circuit.git
```

## Usage

1. Navigate to the project directory

```bash
cd verilog-control-circuit
```
2. Compile and run the Verilog files using your preferred simulation tools.
   (Below is an example using a verilog compiler and simulator, Icarus Verilog).

```bash
iverilog -o alu_control src/*.v
```
Run the simulation
```bash
vvp alu_control
```
View the waveform
```bash
gtkwave waveforms/alu_control.vcd
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
