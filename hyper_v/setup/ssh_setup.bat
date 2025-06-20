@echo off
setlocal enabledelayedexpansion

:: Define variables
set KEY_PATH=%USERPROFILE%\.ssh
set KEY_NAME=id_rsa
set SERVER_USER=your_username
set SERVER_HOST=your_server_ip_or_hostname
set REMOTE_PATH=/home/%SERVER_USER%/.ssh

:: Create directory if it doesn't exist
if not exist "%KEY_PATH%" mkdir "%KEY_PATH%"

:: Generate SSH key pair
ssh-keygen -t rsa -b 4096 -f "%KEY_PATH%\%KEY_NAME%" -N ""

:: Copy public key to server
scp "%KEY_PATH%\%KEY_NAME%.pub" %SERVER_USER%@%SERVER_HOST%:%REMOTE_PATH%/temp.pub

:: Connect to server and set up authorized_keys with correct permissions
ssh %SERVER_USER%@%SERVER_HOST% "cat %REMOTE_PATH%/temp.pub >> %REMOTE_PATH%/authorized_keys && rm %REMOTE_PATH%/temp.pub && chmod 700 %REMOTE_PATH% && chmod 600 %REMOTE_PATH%/authorized_keys"


echo SSH key setup completed successfully!