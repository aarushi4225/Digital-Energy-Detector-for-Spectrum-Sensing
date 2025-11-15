# Digital Energy Detector for Spectrum Sensing

This repository contains a Verilog implementation of a high-speed digital energy detector module designed for efficient spectrum sensing in cognitive radio networks. The project focuses on a hardware-based solution for real-time signal detection.

---

### Important Concepts

* **Cognitive Radio (CR):** A smart radio system that detects available channels in the wireless spectrum and adapts its transmission parameters.
* **Spectrum Sensing:** The process of detecting unused frequency bands (spectrum holes) to enable opportunistic access for secondary users.
* **Energy Detection:** A spectrum sensing technique that measures the energy level of a received signal to infer the presence of a primary user.

---

### System Overview
The core of this project is a digital energy detector that measures the energy of a received signal. The system architecture is designed to be efficient and fast, which is critical for real-time spectrum sensing.

The energy ($E$) of the signal is calculated using the following formula:

$E = \frac{1}{N} \sum_{n=0}^{N-1} |x[n]|^2$

Where:
* $E$ is the energy of the signal.
* $x[n]$ is the received signal.
* $N$ is the number of samples.

---

### Implementation Features

The Verilog module implements a robust and configurable energy detection architecture with the following features:

* **Fixed-Point Arithmetic:** A custom MATLAB script is used to convert floating-point signals into a fixed-point representation suitable for hardware implementation.
* **High-Throughput Processing:** A dedicated multiply-accumulate (MAC) unit computes the instantaneous energy for each complex input sample.
* **Accumulation Unit:** A dedicated accumulator gathers energy over a configurable number of samples to improve detection accuracy.
* **Threshold Comparison:** A comparator continuously checks the accumulated energy against a configurable threshold value.
* **Detection Flag:** A flag is asserted when the accumulated energy exceeds the threshold, indicating the potential presence of a primary user.

This hardware-centric approach provides the high performance required for real-time spectrum sensing in cognitive radio systems.

---

### Repository Structure

```text
├── energy_detection.mc             # MATLAB scripts and functions for signal generation
├── Im_hex.txt                      # Hex file with imaginary part of input samples
├── Re_hex.txt                      # Hex file with real part of input samples
├── th_hex.txt                      # Hex file with threshold value
├── README.md                       # Project documentation
├── energy_detector_tb_behav.wcfg   # Waveform for demonstration
├── energy_detection_tb.v           # Test bench
└── energy_detector.v               # Main Verilog Module
```


### Tools and Technologies

- **Verilog HDL** – core hardware description language for FPGA implementation.  
- **Xilinx Vivado** – FPGA synthesis and simulation.  
- **MATLAB** – signal generation and fixed-point conversion.

---

## Acknowledgement

- Project Mentor: **Dr. Rohit Chaurasiya**, Department of Electrical Engineering, Indian Institute of Technology Jammu. 
- MATLAB Signal generation code adaptation: [`https://in.mathworks.com/matlabcentral/fileexchange/47181-energy-detection-zip`].  
