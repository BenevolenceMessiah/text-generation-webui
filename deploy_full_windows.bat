@echo off
setlocal

:::  ________  _______   ________   _______   ___      ___ ________  ___       _______   ________   ________  _______      
::: |\   __  \|\  ___ \ |\   ___  \|\  ___ \ |\  \    /  /|\   __  \|\  \     |\  ___ \ |\   ___  \|\   ____\|\  ___ \     
::: \ \  \|\ /\ \   __/|\ \  \\ \  \ \   __/|\ \  \  /  / | \  \|\  \ \  \    \ \   __/|\ \  \\ \  \ \  \___|\ \   __/|    
:::  \ \   __  \ \  \_|/_\ \  \\ \  \ \  \_|/_\ \  \/  / / \ \  \\\  \ \  \    \ \  \_|/_\ \  \\ \  \ \  \    \ \  \_|/__  
:::   \ \  \|\  \ \  \_|\ \ \  \\ \  \ \  \_|\ \ \    / /   \ \  \\\  \ \  \____\ \  \_|\ \ \  \\ \  \ \  \____\ \  \_|\ \ 
:::    \ \_______\ \_______\ \__\\ \__\ \_______\ \__/ /     \ \_______\ \_______\ \_______\ \__\\ \__\ \_______\ \_______\
:::     \|_______|\|_______|\|__| \|__|\|_______|\|__|/       \|_______|\|_______|\|_______|\|__| \|__|\|_______|\|_______|
::: 
:::  _____ ______   _______   ________   ________  ___  ________  ___  ___     
::: |\   _ \  _   \|\  ___ \ |\   ____\ |\   ____\|\  \|\   __  \|\  \|\  \    
::: \ \  \\\__\ \  \ \   __/|\ \  \___|_\ \  \___|\ \  \ \  \|\  \ \  \\\  \   
:::  \ \  \\|__| \  \ \  \_|/_\ \_____  \\ \_____  \ \  \ \   __  \ \   __  \  
:::   \ \  \    \ \  \ \  \_|\ \|____|\  \\|____|\  \ \  \ \  \ \  \ \  \ \  \ 
:::    \ \__\    \ \__\ \_______\____\_\  \ ____\_\  \ \__\ \__\ \__\ \__\ \__\
:::     \|__|     \|__|\|_______|\_________\\_________\|__|\|__|\|__|\|__|\|__|
:::                             \|_________\|_________|
::: ___  ________   ________  _________  ________  ___       ___       _______   ________     
::: |\  \|\   ___  \|\   ____\|\___   ___\\   __  \|\  \     |\  \     |\  ___ \ |\   __  \    
::: \ \  \ \  \\ \  \ \  \___|\|___ \  \_\ \  \|\  \ \  \    \ \  \    \ \   __/|\ \  \|\  \   
:::  \ \  \ \  \\ \  \ \_____  \   \ \  \ \ \   __  \ \  \    \ \  \    \ \  \_|/_\ \   _  _\  
:::   \ \  \ \  \\ \  \|____|\  \   \ \  \ \ \  \ \  \ \  \____\ \  \____\ \  \_|\ \ \  \\  \| 
:::    \ \__\ \__\\ \__\____\_\  \   \ \__\ \ \__\ \__\ \_______\ \_______\ \_______\ \__\\ _\ 
:::     \|__|\|__| \|__|\_________\   \|__|  \|__|\|__|\|_______|\|_______|\|_______|\|__|\|__|
:::                    \|_________|

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
:: Play soundbyte from audio
if not exist audio\ mkdir audio
cd audio
set "file=Benevolence_Messiah_DJ_Kwe.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..

timeout /t 3

:: Download the repo code if its not downloaded.
echo As-salamu alaykum!!
echo detecting presence of repo, git cloning if not detected...
echo ---------------------------------------------------------------
if exist docs\ goto ExtensionsCheck
git clone https://github.com/BenevolenceMessiah/text-generation-webui.git Text_Generation
cd Text_Generation
git pull
cd audio
set "file=Benevolence_Messiah_DJ_Kwe.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------
goto ExtensionsCheck

:ExtensionsCheck
:: Install extensions if necssary 
:: git submodule update --init --recursive
echo ---------------------------------------------------------------
echo Starting installation of extension repos if they are not installed...
echo ---------------------------------------------------------------
cd extensions
if exist api\ goto Menu1
git clone https://github.com/BenevolenceMessiah/api.git
echo ---------------------------------------------------------------
git clone https://github.com/DavG25/text-generation-webui-code_syntax_highlight.git code_syntax_highlight
echo ---------------------------------------------------------------
git clone https://github.com/mamei16/LLM_Web_search.git
echo ---------------------------------------------------------------
git clone https://github.com/BenevolenceMessiah/ui_tweaks.git
echo ---------------------------------------------------------------
git clone https://github.com/flurb18/AgentOoba.git
echo ---------------------------------------------------------------
git clone https://github.com/xr4dsh/CodeRunner.git
echo ---------------------------------------------------------------
git clone -b alltalkbeta https://github.com/erew123/alltalk_tts.git
echo ---------------------------------------------------------------
goto Menu1

:Menu1
cd ..
echo ---------------------------------------------------------------
echo What Would you like to do?
echo ---------------------------------------------------------------
echo A) Import Custom User Data (settings, models, extension data, etc.)
echo B) Install Text Generation Web UI
echo D) Run Text Generation Web UI via Gradio 
echo E) Run Text Generation Web UI via Docker
echo F) Run Discord bot (Run after web UI is running)
echo X) Install/reinstall/fix Python and Git. (Only do this if you don't have these installed
echo    or in the event you encounter errors related to Python or Git.)
echo C) Exit
echo U) Update repo.
echo ---------------------------------------------------------------
set /P option=Enter your choice:
if %option% == D goto Run
if %option% == d goto Run
if %option% == E goto RunDocker
if %option% == e goto RunDocker
if %option% == A goto ImportData
if %option% == a goto ImportData
if %option% == B goto Install
if %option% == b goto Install
if %option% == F goto Discordbot
if %option% == f goto Discordbot
if %option% == X goto Python/GitInstall
if %option% == x goto Python/GitInstall
if %option% == C goto End
if %option% == c goto End
if %option% == U goto Updater
if %option% == u goto Updater

:Python/GitInstall
echo ---------------------------------------------------------------
echo As-salamu alaykum!!
echo What do you need to install?
echo ---------------------------------------------------------------
echo 9) Install Git.
echo 10) Install Python 3.10. (Make sure to enable PATH)!
echo M) Main Menu
echo R) Restart the .bat file (do this after installing either or both of these).
echo C) Exit
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == 9 goto GitInstall
if %option% == 10 goto PythonInstall
if %option% == 11 goto DockerDesktop
if %option% == R goto RestartCMD
if %option% == M goto Menu1
if %option% == C goto End

:GitInstall
echo Installing Git...
echo ---------------------------------------------------------------
cd /d %~dp0
call curl "https://github.com/git-for-windows/git/releases/download/v2.46.0.windows.1/Git-2.46.0-64-bit.exe" -o Git-2.46.0-64-bit.exe
start call Git-2.46.0-64-bit.exe
goto Python/GitInstall

:PythonInstall
echo Installing Python 3.10...
echo ---------------------------------------------------------------
cd /d %~dp0
call curl "https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe" -o python-3.10.6-amd64.exe
start call python-3.10.6-amd64.exe
goto Python/GitInstall

:DockerDesktop
echo Installing Docker Desktop...
echo ---------------------------------------------------------------
cd /d %~dp0
call curl "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module" -o docker-desktop-installer.exe
start call docker-desktop-installer.exe
goto Python/GitInstall

:RestartCMD
echo Restarting...
echo Deleting installer .exe files if they exist...
echo ---------------------------------------------------------------
if exist Git-2.46.0-64-bit.exe del Git-2.46.0-64-bit.exe
if exist python-3.10.6-amd64.exe del python-3.10.6-amd64.exe
if exist docker-desktop-installer.exe del docker-desktop-installer.exe
start call deploy_full_windows.bat
exit

:ImportData
echo ---------------------------------------------------------------
echo Would you like to import custom user data (models, settings, etc.)?
echo ---------------------------------------------------------------
echo 1) Yes (Only Do this if you have opened 'Import_User_Data.bat' in a text 
echo    editor and followed the instructions)!
echo 2) No (Install)
echo 3) Run program if already installed.
echo ---------------------------------------------------------------
set /P option=Enter your choice:
if %option% == 1 goto userdata
if %option% == 2 goto Install
if %option% == 3 goto Run

:userdata
echo Downloading your data...
echo ---------------------------------------------------------------
call Import_User_Data.bat
goto Menu1

:Run
echo Running installation or Web UI if installed...
echo ---------------------------------------------------------------
start call start_windows.bat
goto ExtensionsCheck

:RunDocker
::Install CodeRunner Docker
echo Running Docker image... 
echo - Make sure Docker Desktop is running before proceeding!
echo - Make sure  cp docker/.env.example .env Edit .env and set 
echo   TORCH_CUDA_ARCH_LIST based on your GPU model.
echo ---------------------------------------------------------------
timeout /t -1
cd docker
cd nvidia
start call docker compose up
cd ..
start call docker compose up --build
cd ..
cd extensions
cd CodeRunner
start call docker compose up
cd ..
cd ..
goto ExtensionsCheck

:Discordbot
echo Running Discord bot config file...
echo Once config file is set, continue.
echo ---------------------------------------------------------------
start config.yml
timeout /t -1
start call start_oobabot.bat
goto Menu1

:Install
@echo off
setlocal enabledelayedexpansion

cd /D "%~dp0"

set PATH=%PATH%;%SystemRoot%\system32

echo "%CD%"| findstr /C:" " >nul && echo This script relies on Miniconda which can not be silently installed under a path with spaces. && goto end

@rem Check for special characters in installation path
set "SPCHARMESSAGE="WARNING: Special characters were detected in the installation path!" "         This can cause the installation to fail!""
echo "%CD%"| findstr /R /C:"[!#\$%&()\*+,;<=>?@\[\]\^`{|}~]" >nul && (
	call :PrintBigMessage %SPCHARMESSAGE%
)
set SPCHARMESSAGE=

@rem fix failed install when installing to a separate drive
set TMP=%cd%\installer_files
set TEMP=%cd%\installer_files

@rem deactivate existing conda envs as needed to avoid conflicts
(call conda deactivate && call conda deactivate && call conda deactivate) 2>nul

@rem config
set INSTALL_DIR=%cd%\installer_files
set CONDA_ROOT_PREFIX=%cd%\installer_files\conda
set INSTALL_ENV_DIR=%cd%\installer_files\env
set MINICONDA_DOWNLOAD_URL=https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Windows-x86_64.exe
set MINICONDA_CHECKSUM=307194e1f12bbeb52b083634e89cc67db4f7980bd542254b43d3309eaf7cb358
set conda_exists=F

@rem figure out whether git and conda needs to be installed
call "%CONDA_ROOT_PREFIX%\_conda.exe" --version >nul 2>&1
if "%ERRORLEVEL%" EQU "0" set conda_exists=T

@rem (if necessary) install git and conda into a contained environment
@rem download conda
if "%conda_exists%" == "F" (
	echo Downloading Miniconda from %MINICONDA_DOWNLOAD_URL% to %INSTALL_DIR%\miniconda_installer.exe

	mkdir "%INSTALL_DIR%"
	call curl -Lk "%MINICONDA_DOWNLOAD_URL%" > "%INSTALL_DIR%\miniconda_installer.exe" || ( echo. && echo Miniconda failed to download. && goto end )

	for /f %%a in ('CertUtil -hashfile "%INSTALL_DIR%\miniconda_installer.exe" SHA256 ^| find /i /v " " ^| find /i "%MINICONDA_CHECKSUM%"') do (
		set "output=%%a"
	)

	if not defined output (
		echo The checksum verification for miniconda_installer.exe has failed.
		del "%INSTALL_DIR%\miniconda_installer.exe"
		goto end
	) else (
		echo The checksum verification for miniconda_installer.exe has passed successfully.
	)

	echo Installing Miniconda to %CONDA_ROOT_PREFIX%
	start /wait "" "%INSTALL_DIR%\miniconda_installer.exe" /InstallationType=JustMe /NoShortcuts=1 /AddToPath=0 /RegisterPython=0 /NoRegistry=1 /S /D=%CONDA_ROOT_PREFIX%

	@rem test the conda binary
	echo Miniconda version:
	call "%CONDA_ROOT_PREFIX%\_conda.exe" --version || ( echo. && echo Miniconda not found. && goto end )

	@rem delete the Miniconda installer
	del "%INSTALL_DIR%\miniconda_installer.exe"
)

@rem create the installer env
if not exist "%INSTALL_ENV_DIR%" (
	echo Packages to install: %PACKAGES_TO_INSTALL%
	call "%CONDA_ROOT_PREFIX%\_conda.exe" create --no-shortcuts -y -k --prefix "%INSTALL_ENV_DIR%" python=3.11 || ( echo. && echo Conda environment creation failed. && goto end )
)

@rem check if conda environment was actually created
if not exist "%INSTALL_ENV_DIR%\python.exe" ( echo. && echo Conda environment is empty. && goto end )

@rem environment isolation
set PYTHONNOUSERSITE=1
set PYTHONPATH=
set PYTHONHOME=
set "CUDA_PATH=%INSTALL_ENV_DIR%"
set "CUDA_HOME=%CUDA_PATH%"

@rem activate installer env
call "%CONDA_ROOT_PREFIX%\condabin\conda.bat" activate "%INSTALL_ENV_DIR%" || ( echo. && echo Miniconda hook not found. && goto end )

@rem setup installer env
start call python one_click.py %*

echo ---------------------------------------------------------------
echo - Please finish GPU installation before proceeding...
echo - once the Web UI initially launches, close it via pressing Ctrl+c in that CMD window.
echo - Ignore any errors on this CMD window as the extensions have not finished installing at this juncture.
echo ---------------------------------------------------------------
timeout /t -1

:: Install Additional Dependencies
pip install xformers
pip install jupyter
pip install docker

:: Install Oobabot
pip install git+https://github.com/BenevolenceMessiah/oobabot
oobabot --generate-config > config.yml

:: Install Alltalk TTS
cd extensions
cd alltalk_tts
start call atsetup.bat
cd ..
cd ..

:: Generate Oobabot Invite Link
oobabot --invite -c config.yml
echo ---------------------------------------------------------------
echo Edit the oobabot config.yml file with your corresponding discord credentials.
echo ---------------------------------------------------------------
start config.yml

echo ---------------------------------------------------------------
echo please finish AllTalk TTS setup before continuing.
echo Updated the Extensions via the update wizard...
echo ...and...
echo download models while you wait for things to install!
echo ---------------------------------------------------------------
timeout /t -1
start call update_wizard_windows.bat
start call download_models.bat
:: start call start_windows.bat
goto Run

@rem enter commands
cmd /k "%*"

:end
pause

