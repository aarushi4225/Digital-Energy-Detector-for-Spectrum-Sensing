# Digital Energy Detector for Spectrum Sensing

Verilog implementation of a high-speed digital energy detector module designed for efficient spectrum sensing in cognitive radio networks.

## Important Terminologies

- **Cognitive Radio (CR):** A smart radio that detects available channels in wireless spectrum and adapts transmission parameters accordingly.
- **Primary User (PU):** Licensed user of a frequency band with transmission priority.
- **Secondary User (SU):** Unlicensed user accessing spectrum opportunistically without interfering with PU.
- **Spectrum Sensing:** Detecting unused frequency bands (spectrum holes) to enable SU access.
- **Spectrum Hole:** Frequency bands unused by PU.
- **Data Fusion Center (DFC):** Central unit that aggregates data from multiple SUs to improve sensing accuracy.
- **Cooperative Spectrum Sensing (CSS):** Collaborative sensing by multiple SUs to enhance detection.
- **Energy Detection:** Spectrum sensing technique measuring signal energy to detect PU presence.

## Spectrum and Data Growth

- **Exponential Data Growth:** Mobile data expected to grow by 1122% from 2017 to 2025.
- **Spectrum Deficit:** Predicted shortage of 853 MHz in cellular spectrum by 2025.
- **Spectrum Management:** Various detection techniques including energy detection, cyclostationary, eigenvalue methods are used.
- **Cooperative Sensing:** Multiple SUs with DFC collaborate for better spectrum awareness.
- **Implementation:** Focus on efficient algorithms and hardware for real-time spectrum sensing and data handling.

## Energy Detection Technique

- **Working Principle:** Measure the energy level of received signals over a bandwidth to infer PU presence.
  
- **Formula:**
  $$
  E = \frac{1}{N} \sum_{n=0}^{N-1} |x[n]|^2
  $$
  Where:
  - $$ E $$ is the energy,
  - $$ x[n] $$ is the received sample at time $$ n $$,
  - $$ N $$ is the number of samples.
  
- **Low Power:** Designs emphasize low power consumption to support battery-operated CR networks.

## MATLAB Signal Generation

- The signal generation scripts used to create test inputs for validating the energy detector are adapted from external sources.  
- **Credits:** Original MATLAB code for signal generation is authored by [Author Name / External Source].  
- These scripts generate representative wireless signal scenarios, including noisy and fading environments, to test spectrum sensing algorithms.

## Fixed-Point Conversion Using MATLAB

- Custom MATLAB functions convert floating-point signals into fixed-point representations compatible with the Verilog hardware module.  
- Specifically, data is converted into **Q4.12 fixed-point format** (16 bits total: 4 integer bits and 12 fractional bits).  
- This step ensures accurate hardware simulation and synthesis by aligning MATLAB generated data formats with FPGA bit widths and fixed-point arithmetic constraints.

## Verilog Implementation

- Implemented in Verilog HDL with synthesis targeted for Xilinx FPGAs using Vivado.  
- Features:
  - **16-bit fixed-point sum-of-squares unit:** Computes instantaneous energy for each complex input sample.  
  - **43-bit accumulator:** Accumulates energy over 1000 samples to improve detection accuracy.  
  - **Dedicated Multiply-Accumulate (MAC) unit:** Enables high-throughput, real-time energy accumulation.  
  - **Threshold Comparator:** Continuously compares accumulated energy against a configurable threshold.  
  - **Detection Flag:** Asserts a detection signal indicating presence of a primary user when energy exceeds the threshold.  
  
- This architecture supports efficient, fast, and accurate spectrum sensing critical for cognitive radio performance.

## Repository Structure

/EnergyDetector
├── EnergyDetector.v # Main Verilog energy detector module

├── EnergyDetector_tb.v # Testbench for simulation and verification

├── Re_hex # Hex file with real part of input samples

├── Im_hex # Hex file with imaginary part of input samples

├── th_hex # Hex file with threshold value

├── README.md # Project documentation (this file)

├── matlab/ # MATLAB scripts and functions for signal generation and fixed-point conversion

└── Waveform/ # For demonstration


## Usage

1. Prepare your input sample files (`Re_hex`, `Im_hex`) and threshold file (`th_hex`) in hex format corresponding to 16-bit Q4.12 fixed-point numbers.  
2. Run `EnergyDetector_tb.v` in your preferred Verilog simulator (e.g., Vivado XSim).  
3. Monitor the `detected` signal to observe spectrum occupancy detection events.  
4. Adjust parameters such as sample size and threshold in `EnergyDetector.v` as needed.

## Tools and Technologies

- **Verilog HDL** – core hardware description language for FPGA implementation.  
- **Xilinx Vivado** – FPGA synthesis and simulation.  
- **MATLAB** – signal generation and fixed-point conversion.  
