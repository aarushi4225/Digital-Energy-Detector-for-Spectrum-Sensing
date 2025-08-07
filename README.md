# Digital Energy Detector for Spectrum Sensing

Verilog implementation of a high-speed digital energy detector module designed for efficient spectrum sensing in cognitive radio networks.

## Important Terminologies

- **Cognitive Radio (CR):** A smart radio that detects available channels in wireless spectrum and adapts transmission parameters accordingly.
- **Primary User (PU):** Licensed user of a frequency band with transmission priority.
- **Secondary User (SU):** Unlicensed user accessing spectrum opportunistically without interfering with PU.
- **Spectrum Sensing:** Detecting unused frequency bands (spectrum holes) to enable SU access.
- **Data Fusion Center (DFC):** Central unit that aggregates data from multiple SUs to improve sensing accuracy.
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
The energy detection method determines the presence of a signal by measuring its energy.

$E = \frac{1}{N} \sum_{n=0}^{N-1} |x[n]|^2$

Where:
* $E$ is the energy of the signal.
* $x[n]$ is the received signal.
* $N$ is the number of samples.

- **Low Power:** Designs emphasize low power consumption to support battery-operated CR networks.

## Features:
  - Custom MATLAB functions convert floating-point signals into fixed-point representations compatible with the Verilog hardware module. 
  - **16-bit fixed-point sum-of-squares unit:** Computes instantaneous energy for each complex input sample.  
  - **43-bit accumulator:** Accumulates energy over 1000 samples to improve detection accuracy.  
  - **Dedicated Multiply-Accumulate (MAC) unit:** Enables high-throughput, real-time energy accumulation.  
  - **Threshold Comparator:** Continuously compares accumulated energy against a configurable threshold.  
  - **Detection Flag:** Asserts a detection signal indicating presence of a primary user when energy exceeds the threshold.  
  
- This architecture supports efficient, fast, and accurate spectrum sensing critical for cognitive radio performance.

## Repository Structure

```text
.
├── energy_detection.mc             # MATLAB scripts and functions for signal generation
├── Im_hex.txt                      # Hex file with imaginary part of input samples
├── Re_hex.txt                      # Hex file with real part of input samples
├── th_hex.txt                      # Hex file with threshold value
├── README.md                       # Project documentation
├── energy_detector_tb_behav.wcfg   # Waveform for demonstration
├── energy_detection_tb.v           # Test bench
└── energy_detector.v               # Main Verilog Module
```

## Tools and Technologies

- **Verilog HDL** – core hardware description language for FPGA implementation.  
- **Xilinx Vivado** – FPGA synthesis and simulation.  
- **MATLAB** – signal generation and fixed-point conversion.

# Acknowledgement

- Project guided by **Dr. Rohit Chaurasiya**, Asst. Professor, Department of Electrical Engineering, IIT Jammu.  
- MATLAB signal generation code adapted from [`https://in.mathworks.com/matlabcentral/fileexchange/47181-energy-detection-zip`].  
- Fixed Point conversion and Verilog Implementation Performed by - Aarushi Singh (Me).
