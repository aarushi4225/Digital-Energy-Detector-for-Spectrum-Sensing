# Digital-Energy-Detector-for-Spectrum-Sensing
Verilog Implementation of a high-speed digital energy detector module for efficient spectrum sensing.

# Important Terminologies

- **Cognitive Radio (CR)**: A smart radio that can detect available channels in a wireless spectrum and change transmission parameters accordingly.

- **Primary User (PU)**: A licensed user of a specific frequency band that has priority over the spectrum.

- **Secondary User (SU)**: An unlicensed user that can access the spectrum when it is not being used by the primary user.

- **Spectrum Sensing**: The process of detecting unused frequency bands (spectrum holes) to enable secondary users to access them without interfering with primary users.

- **Spectrum Hole**: A frequency band that is not currently being used by primary users and can be utilized by secondary users.

- **Data Fusion Center (DFC)**: A centralized unit that collects and processes data from multiple secondary users to make decisions regarding spectrum occupancy.

- **Cooperative Spectrum Sensing (CSS)**: A technique where multiple secondary users collaborate to improve the accuracy of spectrum sensing.

- **Energy Detection**: A spectrum sensing technique that measures the energy level of received signals to detect the presence of primary users.

## Spectrum and Data Growth
- Data Growth (2017-2025): Exponential increase in mobile data, reaching a 1122% growth by 2025.
- Spectrum Deficit: Significant shortage of cellular spectrum, with a deficit of 853 MHz by 2025.
- Spectrum Sensing: Various detection methods (Energy, Cyclostationary, Eigenvalue etc) for managing spectrum use.
- Cooperative Spectrum Sensing: Involves multiple secondary users and a centralized data fusion center for efficient spectrum management.
- Implementation: Focus on algorithms and devices for effective spectrum sensing and data transmission.

## Energy Detection Technique
- How it Works: Measures the energy level of the received signal over a specific bandwidth to determine the presence of a primary user.
- Low Power Consumption: Emphasis on designing circuits that minimize power usage while maintaining performance, crucial for battery-operated devices in cognitive radio networks.

**Energy Detection Formula:**

The energy detection method determines the presence of a signal by measuring its energy.
$E = \frac{1}{N} \sum_{n=0}^{N-1} |x[n]|^2$
Where:
* $E$ is the energy of the signal.
* $x[n]$ is the received signal.
* $N$ is the number of samples.

# MATLAB Signal Generation
* The signal generation scripts used to create test inputs for validating the energy detector are adapted from external sources.
* Credits: Original MATLAB code for signal generation is authored by [Author Name / External Source].
* These scripts generate representative wireless signal scenarios, including noisy and fading environments, to test spectrum sensing algorithms.

# Fixed-Point Conversion Using MATLAB
* Custom MATLAB functions convert floating-point signals into fixed-point representations compatible with the Verilog hardware module.
* Specifically, data is converted into Q4.12 fixed-point format (16 bits total: 4 integer bits and 12 fractional bits).
* This step ensures accurate hardware simulation and synthesis by aligning MATLAB generated data formats with FPGA bit widths and fixed-point arithmetic constraints.

# Verilog Implementation
*Implemented in Verilog HDL with synthesis targeted for Xilinx FPGAs using Vivado.
*Features:
          - 16-bit fixed-point sum-of-squares unit: Computes instantaneous energy for each complex input sample.
          - 43-bit accumulator: Accumulates energy over 1000 samples to improve detection accuracy.
          - Dedicated Multiply-Accumulate (MAC) unit: Enables high-throughput, real-time energy accumulation.
          - Threshold Comparator: Continuously compares accumulated energy against a configurable threshold.
          - Detection Flag: Asserts a detection signal indicating presence of a primary user when energy exceeds the threshold.

**This architecture supports efficient, fast, and accurate spectrum sensing critical for cognitive radio performance.**

# Repository Structure
text
/EnergyDetector
├── EnergyDetector.v         # Main Verilog energy detector module
├── EnergyDetector_tb.v      # Testbench for simulation and verification
├── Re_hex                   # Hex file with real part of input samples
├── Im_hex                   # Hex file with imaginary part of input samples
├── th_hex                   # Hex file with threshold value
├── README.md                # Project documentation (this file)
├── matlab/                  # MATLAB scripts and functions for signal generation and fixed-point conversion
└── docs/                    # Additional documentation (optional)

# Usage
* Prepare your input sample files (Re_hex, Im_hex) and threshold file (th_hex) in hex format corresponding to 16-bit Q4.12 fixed-point numbers.
* Run EnergyDetector_tb.v in your preferred Verilog simulator (e.g., Vivado XSim).
* Monitor the detected signal to observe spectrum occupancy detection events.
* Adjust parameters such as sample size and threshold in EnergyDetector.v as needed.

# Tools and Technologies
- Verilog HDL – core hardware description language for FPGA implementation.
- Xilinx Vivado – FPGA synthesis and simulation.
- MATLAB – signal generation and fixed-point conversion.
  
