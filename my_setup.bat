@echo off
echo ===================================================
echo    Windows Personal Environment Setup (Docker-Style)
echo ===================================================

:: 全自動・サイレント用のオプション変数
set OPT=--accept-package-agreements --accept-source-agreements --silent

:: --- [必須・メインツール] ---

:: 1. ブラウザ・基本ツール
echo [1/5] Installing Basic Tools...
winget install --id Google.Chrome.EXE -e
winget install --id 7zip.7zip -e
winget install --id WinMerge.WinMerge -e

:: 2. エディタ
echo [2/5] Installing Editors...
winget install --id sakura-editor.sakura -e
winget install --id Microsoft.VisualStudioCode -e
winget install --id Anysphere.Cursor -e

:: 3. 開発基盤
echo [3/5] Installing Dev Runtimes...
winget install --id Docker.DockerDesktop -e
winget install --id OpenJS.NodeJS.22 -e
winget install --id Python.Python.3.11 -e

:: 4. AI CLIツール
echo [4/5] Installing AI CLI Tools...
call npm install -g @anthropic-ai/claude-code
call npm install -g @google/generative-ai

:: 5. Git・ネットワーク
echo [5/5] Installing Git and Tools...
winget install --id Atlassian.Sourcetree -e
winget install --id TortoiseGit.TortoiseGit -e
winget install --id TeraTermProject.teraterm -e

:: --- [予備・アーカイブ（必要になったら :: を消して使う）] ---
:: echo [Option] Checking Optional Packages...
:: winget install --id GitHub.cli -e
:: winget install --id Amazon.Kindle -e
:: winget install --id Postman.Postman -e
:: winget install --id CoreyButler.NVMforWindows -e
:: winget install --id RProject.R -e
:: winget install --id Rustlang.Rustup -e

echo ===================================================
echo    Setup Complete! Please restart your PC.
echo ===================================================
pause
