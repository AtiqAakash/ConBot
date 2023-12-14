# ConBot - An automatic standalone script to configure Ardupilot and the necessary simulation environment in Windows(X).

<img src="https://images.squarespace-cdn.com/content/v1/6540bd7a746edd2f17ce3c19/39dd2695-7e4e-47f3-96ec-67d9ef5f8efb/Robot+Aviation++Logo_01_DarkBlueGrad_DarkText.png" alt="Project Logo" width="500" height="150">


## Overview

ConBot is a PowerShell script designed to automate the configuration of a Windows operating system for UAV development and simulation in Ardupilot environment. It performs the installation and configuration of essential tools such as Python, MAVProxy, QGroundControl, Cygwin, Arm GCC compiler, and sets up the ArduPilot repository.

## Prerequisites

Before running ConBot, ensure that you meet the following prerequisites:

- Windows OS (Supported versions: Windows 10/11 Windows Server 2016/2023)

## Getting Started

Execute the PowerShell script with administrative privileges:

powershell
Copy code
.\conbot.ps1


Follow on-screen prompts and wait for the script to complete.

## Configuration Steps

- Installs Python on the system.

- Installs MAVProxy for communication with ArduPilot vehicles.

- Installs QGroundControl, a ground control station for ArduPilot.

- Installs Cygwin, providing a large collection of GNU and Open Source tools.

- Installs the Arm GCC compiler for building ArduPilot firmware.

- Clones the ArduPilot repository from https://github.com/ArduPilot/ardupilot.git.

- Configures ArduPilot for simulation and development.

- Verifies that the installation and configuration were successful.

## Troubleshooting

If you encounter any issues during the setup process, you might come across missing DLL errors. If this happens, follow these steps to resolve the issue:

1. Download the necessary DLL files from [this repository](https://github.com/AtiqAakash/ConBot).
2. Place the downloaded DLL files in the `C:\Windows\System32\` directory.

3. Re-run ConBot by executing the PowerShell script:

   ```powershell
   .\conbot.ps1

## SITL FMS
For slecting the simulation type in SITL, use this [Tool](https://github.com/AtiqAakash/SITL-FMS).

Contributing
Contributions are welcome! If you have any improvements or bug fixes, please submit a pull request.

License
This project is licensed under the MIT License.

Contact
For questions or support, please contact us at aakash.unipune@gmail.com.








