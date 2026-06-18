# orbitalcore
A custom open-source microprocessor architecture with an integrated programmable Interchangeable Wave Supply (IWS) for real-time signal generation and dynamic clock tuning. This microprocessor is small, enough to fit in about ~1500 LUTs, if applied to FPGA.

# What is it?
An open-source, custom-silicon-ready processor architecture designed specifically for embedded instrumentation, mixed-signal control, and real-time waveform synthesis. 

Featuring a unique, hardware-level **Interchangeable Wave Supply (IWS)** instruction set, this processor can function natively as a programmable wobbulator, function generator (sine, square, triangle), and precision RF frequency generator without the overhead of traditional software-bound architectures.

## Key features

* **Custom Pipeline with Dedicated Core Tuning:** Supports dynamic, cycle-accurate clock manipulation via hardware-level Phase-Locked Loop control (`pclk` / `pclkt`).
* **Integrated IWS Engine:** Directly drives mixed-signal peripherals in 2 clock cycles using the native `iws` instruction (`0x80`).
* **Optimized Execution:** Features a compact instruction set including 1-cycle logical/arithmetic operations (with a multi-cycle hardware `mul`) and 2-cycle branch/stack operations.

## Instruction Set Architecture (ISA) Reference

[span_4](start_span)The following table outlines the complete instruction set for the OXS-Processor core[span_4](end_span):

| Instruction Name | Opcode | Binary Encoding | Description | Cycle Count |
| :--- | :--- | :--- | :--- | :--- |
| **nop** | `0x00` | `0000 0000` | NOP | 1 |
| **ld** | `0x01` | `0000 0001` | LD [Rs1 + OFF] to Reg | 2 |
| **str** | `0x02` | `0000 0010` | ST RS1 to [RD + OFF] | 2 |
| **mv** | `0x03` | `0000 0011` | $Rd = Rs1$ | 1 |
| **li** | `0x04` | `0000 0100` | Rd = imm. | 1 |
| **add** | `0x10` | `0001 0000` | $Rd = Rs1 + Rs2$ | 1 |
| **sub** | `0x11` | `0001 0001` | $Rd = Rs1 - Rs2$ | 1 |
| **mul** | `0x12` | `0001 0010` | $Rd = Rs1 \times Rs2$ | 3 |
| **and** | `0x20` | `0010 0000` | Rd = Rs1 & Rs2 | 1 |
| **or** | `0x21` | `0010 0001` | Rd = Rs1 \| Rs2 | 1 |
| **xor** | `0x22` | `0010 0010` | Rd = Rs1 ^ Rs2 | 1 |
| **shft** | `0x23` | `0010 0011` | Rd = Rs1 << Rs2 | 1 |
| **jmp** | `0x30` | `0011 0000` | PC = Addr. | 1 |
| **br** | `0x31` | `0011 0001` | If (FLG == TRUE) PC = Addr | 2 |
| **call** | `0x32` | `0011 0010` | PUSH PC, PC = Addr | 2 |
| **ret** | `0x33` | `0011 0011` | POP PC | 2 |
| **out** | `0x34` | `0011 0100` | $OUT = Rs1$ | 1 |
| **beq** | `0x35` | `0011 0101` | BR (Rs1 == Rs2) | 2 |
| **bne** | `0x36` | `0011 0110` | BR (Rs1 != Rs2) | 2 |
| **in** | `0x37` | `0011 0111` | $IN = Rs1$ | 1 |
| **p** | `0x38` | `0011 1000` | $sp = sp - 1$, $rd = stack[sp]$ | 1 |
| **ps** | `0x39` | `0011 1001` | $stack[sp] = rd$, $sp = sp + 1$ | 1 |
| **iws** | `0x80` | `1000 0000` | IWS_DAC = Rs1 | 2 |
| **pclk** | `0x81` | `1000 0001` | CORE1_PLL $PLL = Rs1$ | 2 |
| **pclkt** | `0x82` | `1000 0010` | CORE2_PLL $PLL = Rs1$ | 2 |

---

