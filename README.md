# BOB the Universal Object Tracker

Below are the installation instructions for installing BOB, your friendly Object (bird, insect, bat, uap) detector, tracker and recorder
The application uses Docker and Docker Compose to run, at present we are still in a very early release phase so this the install process is not polished at all. We will endeavour to improve this over time so please bear with us.

*Whilst it is recommended to run on native Linux, it is possible to run Bobcamera on Windows 10 or Windows 11 through WSL (more resource intensive). Please note refer to the [Windows setup instructions](WINDOWS_SETUP.md) to prep your machine before running the steps below.*

## The following steps will need to be performed in a linux terminal

- Ubuntu 23.10 has been tested
- Ubuntu 22.04 has been tested
- Ubuntu 24.04 has been tested

### 1. Install dependencies
- Git
- Curl
```
sudo apt-get install git curl
```
### 2. Clone the github repo
```
git clone --recursive https://github.com/bobcamera/bobinstall.git
```
### 3. Change directory to bobinstall
```
cd bobinstall
```
### 4. Run the setup script, this will install docker and docker compose
```
./setup.sh
```
### 5. Reboot the machine
- Only required if Docker has been installed during the setup script
```
sudo shutdown -r now
```
### 6. Navigate back to the bobinstall directory once rebooted
```
cd ~/bobinstall
```
### 7. To setup BOB
* #### Open my_config.yaml in your preference editor (vscode, vim...)
* #### Edit the settings as explained in the comments

### 8. To start up BOB
```
./run.sh my_config.yaml
```
### 9. Use your system browser and navigate to [http://localhost:8080](http://localhost:8080)

### 10. To shut BOB down, type CTRL + C in the terminal

--- 
## Appendix: 

### I. To update to the lastest version of bob please execute: 
```
git pull origin main
```

### II. Reset the config file to factory conditions: 
```
cp dual_camera_config_example.yaml my_config.yaml
```