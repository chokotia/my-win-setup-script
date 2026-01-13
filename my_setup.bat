@echo off
echo ===================================================
echo    Windows Personal Environment Setup
echo ===================================================

:: Silent installation options
set OPT=--accept-package-agreements --accept-source-agreements --silent

:: 1. Browser, Basic Tools, and Cloud
echo [1/5] Installing Basic Tools and Cloud...
winget install --id Google.Chrome.EXE -e %OPT%
winget install --id Google.GoogleDrive -e %OPT%
winget install --id 7zip.7zip -e %OPT%
winget install --id WinMerge.WinMerge -e %OPT%
winget install --id Anthropic.Claude -e %OPT%
winget install --id Amazon.Kindle -e %OPT%

:: 2. Editors
echo [2/5] Installing Editors...
winget install --id sakura-editor.sakura -e %OPT%
winget install --id Microsoft.VisualStudioCode -e %OPT%
winget install --id Anysphere.Cursor -e %OPT%

:: 3. Development Runtimes
echo [3/5] Installing Dev Runtimes...
winget install --id Docker.DockerDesktop -e %OPT%
winget install --id OpenJS.NodeJS.22 -e %OPT%
:: pyenv-win (PowerShell installer)
powershell -Command "Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1' -OutFile './install-pyenv-win.ps1'; &'./install-pyenv-win.ps1'"
del install-pyenv-win.ps1
:: Install Python via pyenv and set as global
set "PATH=%USERPROFILE%\.pyenv\pyenv-win\bin;%USERPROFILE%\.pyenv\pyenv-win\shims;%PATH%"
call pyenv install 3.11.9
call pyenv global 3.11.9
:: Poetry (official installer)
powershell -Command "(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | python -"
:: Add Poetry to user PATH permanently
powershell -Command "[Environment]::SetEnvironmentVariable('PATH', $env:APPDATA + '\Python\Scripts;' + [Environment]::GetEnvironmentVariable('PATH', 'User'), 'User')"

:: 4. AI CLI Tools
echo [4/5] Installing AI CLI Tools...
call npm install -g @anthropic-ai/claude-code @google/gemini-cli

:: 5. Git and Network Tools
echo [5/5] Installing Git and Tools...
winget install --id Atlassian.Sourcetree -e %OPT%
winget install --id TortoiseGit.TortoiseGit -e %OPT%
winget install --id TeraTermProject.teraterm -e %OPT%
winget install --id GitHub.cli -e %OPT%

:: --- [Git Basic Configuration Auto-Restore] ---
echo [Extra] Configuring Git...
git config --global user.name "hoge"
git config --global user.email "hoge@hoge"
git config --global core.autocrlf true

echo ===================================================
echo    Setup Complete! Please restart your PC.
echo ===================================================
pause
