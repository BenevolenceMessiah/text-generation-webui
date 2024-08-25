@echo off
setlocal

:: Install extensions if necssary 
:: git submodule update --init --recursive
echo Starting installation of extension repos if they are not installed...
cd extensions
if exist api\ goto ImportData
git clone https://github.com/BenevolenceMessiah/api.git
git clone https://github.com/DavG25/text-generation-webui-code_syntax_highlight.git code_syntax_highlight
git clone https://github.com/mamei16/LLM_Web_search.git
git clone https://github.com/BenevolenceMessiah/ui_tweaks.git
git clone https://github.com/flurb18/AgentOoba.git
git clone https://github.com/xr4dsh/CodeRunner.git
git clone https://github.com/erew123/alltalk_tts.git
goto ImportData

:ImportData
cd ..
echo ---------------------------------------------------------------
echo Would you like to import custom user data (models, settings, etc.)?
echo ---------------------------------------------------------------
echo 1) Yes (Only Do this if you have opened 'Import_User_Data.bat' in a text 
echo    editor and followed the instructions)!
echo 2) No
echo 3) Run program if already installed.
echo ---------------------------------------------------------------
set /P option=Enter your choice:
if %option% == 1 goto userdata
if %option% == 2 goto Run
if %option% == 3 goto Run

:userdata
echo Downloading your data...
echo ---------------------------------------------------------------
start call Import_User_Data.bat
goto Run

:Run
start call start_windows.bat
@echo on
#                                                                                                                                                                                                                                                                                                          WAIT UNTIL THE INITIAL BASE INSTALL FINISHES (or at least until you get to the GPU Selection prompt) BEFORE PROCEEDING!!! (Please).                                                                                                                                                                                                                                                                                                                                                                       And don't try to run these installers (with the exception of the 'model downloader' tool) simultaneously. Wait for each one to complete. before moving on to the next.                                                                                                                                                                                                                                                                                                                                                                      #
@echo off 
timeout /t -1
start call update_wizard_windows.bat
start call download_models.bat

@echo off

cd /D "%~dp0"

set PATH=%PATH%;%SystemRoot%\system32

echo "%CD%"| findstr /C:" " >nul && echo This script relies on Miniconda which can not be silently installed under a path with spaces. && goto end

@rem fix failed install when installing to a separate drive
set TMP=%cd%\installer_files
set TEMP=%cd%\installer_files

@rem deactivate existing conda envs as needed to avoid conflicts
(call conda deactivate && call conda deactivate && call conda deactivate) 2>nul

@rem config
set CONDA_ROOT_PREFIX=%cd%\installer_files\conda
set INSTALL_ENV_DIR=%cd%\installer_files\env

@rem environment isolation
set PYTHONNOUSERSITE=1
set PYTHONPATH=
set PYTHONHOME=
set "CUDA_PATH=%INSTALL_ENV_DIR%"
set "CUDA_HOME=%CUDA_PATH%"

@rem activate installer env
call "%CONDA_ROOT_PREFIX%\condabin\conda.bat" activate "%INSTALL_ENV_DIR%" || ( echo. && echo Miniconda hook not found. && goto end )

:: Install Oobabot
pip install git+https://github.com/BenevolenceMessiah/oobabot
oobabot --generate-config > config.yml

::Install CodeRunner Docker
cd extensions
cd CodeRunner
docker compose up
cd ..
cd ..

:: Install Alltalk TTS
cd extensions
cd alltalk_tts
start call atsetup.bat
cd ..
cd ..

:: Install XFormers
pip install xformers

:: Generate Oobabot Invite Link
oobabot --invite -c config.yml

@rem enter commands
cmd /k "%*"

:end
pause

