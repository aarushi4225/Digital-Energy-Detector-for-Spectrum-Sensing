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

  
