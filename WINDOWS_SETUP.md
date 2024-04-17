#  Bobcamera on Windows

It is possible to run Bobcamera on Windows 10 or Windows 11 through WSL (Windows Subsystem for Linux) install of Ubuntu.
Ubuntu through WSL can be installed through the Windows store now, however we recommend that you follow the steps here.

## Prerequisites

- You will need a compatible version of Windows (currently Windows 11 or Windows 10 2004 or higher with Build 19041 or higher)
- Virtualization should be enabled on your PC. You may need to:
  - Ensure 'Virtualization Technology' is enabled in BIOS (the bios name may differ based on make and model of the motherboard)
  - Enable Virtualization in the "Turn Windows Features on/off" area of the control panel. The steps are outlined [here](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v#enable-the-hyper-v-role-through-settings)

## Step 1: Install WSL

Open PowerShell (find this using Windows search) and right click to run as Administrator. Run the following command:

```powershell
wsl --install
```

This command will enable the necessary Windows features, download the Linux kernel, set up WSL2, and install a default Linux distribution (Ubuntu 20.04 LTS by default currently).

## Step 2: Check WSL version 

WSL2 has improved features like a full Linux kernel, and it's recommended for this project.

To check whether WSL2 is enabled, run:

```powershell
wsl -l -v
```

If running version 1, you can switch over to version 2 using:
```powershell
wsl --set-version 2
```

If required, follow any additional prompts to complete the installation of WSL2.

## Step 3: Install Docker Desktop for Windows

Download and install Docker Desktop for Windows from the [official website](https://www.docker.com/products/docker-desktop/).
During installation, ensure the "WSL 2" feature is selected.


After installation, go to 'Settings' in Docker Desktop (cog icon). Go to 'General' and make sure 'Use the WSL 2 based engine' is checked.

In the 'Resources' section, under 'WSL Integration', enable integration with your installed Linux distribution.

## Step 4: Run Ubuntu and Install Bobcamera

Open Ubuntu from Start menu in Windows to bring up a terminal. Then proceed with the main Bobcamera install steps laid out in the README.md

## References
- Official Documentation for WSL
https://learn.microsoft.com/en-us/windows/wsl/
