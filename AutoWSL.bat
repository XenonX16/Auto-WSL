echo off
cls
echo 2 methods: the method 1 or the method 2? (the method 1 requires Windows Insider)
set /p method
if %method%==1 wsl --install
if %method%==2 goto 2
:2
echo Enable WSL...
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
echo Enable virtualization...
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
echo Installing a kernel update...
start https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
echo Enable WSL Graphics...
wsl --set-default-version 2
echo Choose a distro: (1-1a/b/c-2-3-4-5)
echo 1. Ubuntu
echo 1a. Ubuntu 16.04
echo 1b. Ubuntu 18.04
echo 1c. Ubuntu 20.04
echo 2. Debian (not debianissimo)
echo 3. Kali Linux
echo 4. opensuse 42
echo 5. SLES 12
set /p distro
if %distro%==1 wsl --install -d Ubuntu
if %distro%==1a wsl --install -d Ubuntu-16.04
if %distro%==1b wsl --install -d Ubuntu-18.04
if %distro%==1c wsl --install -d Ubuntu-20.04
if %distro%==2 wsl --install -d Debian
if %distro%==3 wsl --install -d kali-linux
if %distro%==4 wsl --install -d openSUSE-42
if %distro%==5 wsl --install -d SLES-12
