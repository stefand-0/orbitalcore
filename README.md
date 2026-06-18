# orbitalcore
A custom open-source microprocessor architecture with an integrated programmable Interchangeable Wave Supply (IWS) for real-time signal generation and dynamic clock tuning. This microprocessor is small, enough to fit in about ~1500 LUTs, if applied to FPGA.

# What is it?
An open-source, custom-silicon-ready processor architecture designed specifically for embedded instrumentation, mixed-signal control, and real-time waveform synthesis. 

Featuring a unique, hardware-level **Interchangeable Wave Supply (IWS)** instruction set, this processor can function natively as a programmable wobbulator, function generator (sine, square, triangle), and precision RF frequency generator without the overhead of traditional software-bound architectures.

## Key features

* **Custom Pipeline with Dedicated Core Tuning:** Supports dynamic, cycle-accurate clock manipulation via hardware-level Phase-Locked Loop control (`pclk` / `pclkt`).
* **Integrated IWS Engine:** Directly drives mixed-signal peripherals in 2 clock cycles using the native `iws` instruction (`0x80`).
* **Optimized Execution:** Features a compact instruction set including 1-cycle logical/arithmetic operations (with a multi-cycle hardware `mul`) and 2-cycle branch/stack operations.


