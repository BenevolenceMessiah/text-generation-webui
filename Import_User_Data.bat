@echo off
setlocal

:: Instructions: 
:: 1. create a folder called 'userdata'. Copy your user data from the Web UI - i.e. 
::    settings files, AI models, .wav files in the 'voices' folder in Alltalk, etc.
:: 2. Zip that folder and upload it to Google Drive (or a private Github/Huggingface 
::    Repo if you'd rather use authentication tokens), make it downloadable for anyone
::    with the link. Download the .zip via Firefox, right click on the file in the 
::    browsewr and select 'Copy download link'. 
:: 3. Paste that link in between the empty "" in 'call curl ""'.
:: 4. Optionally alter the below 'Checking Mechanism' to suit your needs if you don't
::    use a settings file.

:: Checking Mechanism:
:: (Checks for settings file to avoid downloading the repo repeatedly/overwriting data 
::  in the event the script is accidently called). To disable coment out (add ::) to 
::  'if exist settings.yaml goto exit'.
if exist settings.yaml goto exit

:: Download data.
cd /d %~dp0
call curl "" -o userdata.zip

:: Unzip assets.
powershell -command "Expand-Archive -Force '%~dp0*.zip' '%~dp0'"

:: Delete .zip archive if it exists.
if exist userdata.zip del userdata.zip

pause