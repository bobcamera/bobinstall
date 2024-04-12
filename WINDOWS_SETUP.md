#  Bobcamera on Windows

It is possible to run Bobcamera on Windows 10 or Windows 11 through WSL (Windows Subsystem for Linux). 

## Prerequisites

- Ensure you have a compatible version of Windows 10 (version 2004 or higher with Build 19041 or higher) or Windows 11.
- You will need Admin rights on your Windows machine.

## Step 1: Install WSL

Open PowerShell (find this using Windows search) and right click to run as Administrator. Run the following:

```powershell
wsl --install
```

This command will enable the necessary Windows features, download the Linux kernel, set up WSL, and install a default Linux distribution (Ubuntu by default).

## Step 2: Set WSL version to 2 

WSL 2 has improved features like a full Linux kernel, and it's recommended for this project.

To ensure that WSL 2 is enabled, run:

```powershell
wsl --set-version 2
```

If required, follow any additional prompts to complete the installation of WSL 2.

## Step 3: Install Docker Desktop for Windows

Download and install Docker Desktop for Windows from the [official website](https://www.docker.com/products/docker-desktop/).
During installation, ensure the "WSL 2" feature is selected.


After installation, go to 'Settings' in Docker Desktop (cog icon). Go to 'General' and make sure 'Use the WSL 2 based engine' is checked.

In the 'Resources' section, under 'WSL Integration', enable integration with your installed Linux distribution.

## Step 4

Open Ubuntu from Start menu in Windows to bring up a terminal. Then proceed with the main Bobcamera install steps laid out in the README.md

## References
- Official Documentation for WSL
https://learn.microsoft.com/en-us/windows/wsl/