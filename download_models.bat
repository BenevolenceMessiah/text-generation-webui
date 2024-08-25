@echo off

echo Please choose from the following options:
echo 1. Download Replete-Coder-Llama3-8B-Q8_0-GGUF
echo 2. Download Llama-3-Instruct-8B-SPPO-Iter3-Q8_0-GGUF
echo 3. Download gemma-2-9b-it-Q8_0-GGUF
echo 4. Download mpt-7b-storywriter-Q8_0-GGUF
echo 5. Download dolphin-2.6-mistral-7b-dpo-laser-Q8_0-GGUF
echo 6. Download internlm2_5-7b-chat-Q8_0-GGUF
echo 7. Launch gguf-my-repo (Tool that allows for the search and GGUF conversion of any Transformers model on HuggingFace).
echo 8. Exit

set /P option=Enter your choice: 

if %option% == 1 goto option1
if %option% == 2 goto option2
if %option% == 3 goto option3
if %option% == 4 goto option4
if %option% == 5 goto option5
if %option% == 6 goto option6
if %option% == 7 goto option7
if %option% == 8 goto end

:option1
echo Downloading Replete-Coder-Llama3-8B-Q8_0-GGUF
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/Replete-Coder-Llama3-8B-Q8_0-GGUF
goto end

:option2
echo Downloading Llama-3-Instruct-8B-SPPO-Iter3-Q8_0-GGUF
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/Llama-3-Instruct-8B-SPPO-Iter3-Q8_0-GGUF
goto end

:option3
echo Downloading gemma-2-9b-it-Q8_0-GGUF
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/gemma-2-9b-it-Q8_0-GGUF
goto end

:option4
echo Downloading mpt-7b-storywriter-Q8_0-GGUF
echo Use your HuggingFace username as the username and paste your Github Download Access Token as the password.
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/mpt-7b-storywriter-Q8_0-GGUF
goto end

:option5
echo Downloading dolphin-2.6-mistral-7b-dpo-laser-Q8_0-GGUF
echo Use your HuggingFace username as the username and paste your Github Download Access Token as the password.
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/dolphin-2.6-mistral-7b-dpo-laser-Q8_0-GGUF
goto end

:option6
echo Downloading internlm2_5-7b-chat-Q8_0-GGUF 
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/internlm2_5-7b-chat-Q8_0-GGUF
goto end

:option7
echo Lauching gguf-my-repo
@echo off

start start https://huggingface.co/spaces/BenevolenceMessiah/gguf-my-repo-2

goto end
:exit
echo Asalamu'Alaikum!!
:end
echo Asalamu'Alaikum!!

pause
