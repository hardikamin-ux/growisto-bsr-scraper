@echo off
REM ─────────────────────────────────────────────────────
REM  Growisto BSR Scraper — Windows Installer
REM  Double-click to run (first time only)
REM ─────────────────────────────────────────────────────

echo.
echo ============================================
echo   Growisto BSR Scraper - Setup (Windows)
echo ============================================
echo.

SET REPO_URL=https://raw.githubusercontent.com/hardikamin-ux/growisto-bsr-scraper/main
SET INSTALL_DIR=%USERPROFILE%\growisto-bsr-scraper
SET DESKTOP=%USERPROFILE%\Desktop

REM ── 1. Check Python ──────────────────────────────────
python --version >nul 2>&1
IF ERRORLEVEL 1 (
  echo ERROR: Python is not installed or not in PATH.
  echo Download it from https://www.python.org/downloads/
  echo Make sure to check "Add Python to PATH" during install.
  pause
  exit /b 1
)
echo [OK] Python detected
echo.

REM ── 2. Create install directory ──────────────────────
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"
if not exist "%INSTALL_DIR%\.streamlit" mkdir "%INSTALL_DIR%\.streamlit"
echo [OK] Install directory: %INSTALL_DIR%
echo.

REM ── 3. Download files from GitHub ────────────────────
echo Downloading files...
powershell -Command "Invoke-WebRequest -Uri '%REPO_URL%/app.py' -OutFile '%INSTALL_DIR%\app.py'"
echo   [OK] app.py
powershell -Command "Invoke-WebRequest -Uri '%REPO_URL%/bsr_scraper.py' -OutFile '%INSTALL_DIR%\bsr_scraper.py'"
echo   [OK] bsr_scraper.py
powershell -Command "Invoke-WebRequest -Uri '%REPO_URL%/requirements.txt' -OutFile '%INSTALL_DIR%\requirements.txt'"
echo   [OK] requirements.txt
powershell -Command "Invoke-WebRequest -Uri '%REPO_URL%/BSR_Input_Template.xlsx' -OutFile '%INSTALL_DIR%\BSR_Input_Template.xlsx'"
echo   [OK] BSR_Input_Template.xlsx
powershell -Command "Invoke-WebRequest -Uri '%REPO_URL%/.streamlit/config.toml' -OutFile '%INSTALL_DIR%\.streamlit\config.toml'"
echo   [OK] .streamlit/config.toml
echo.

REM ── 4. Install Python packages ───────────────────────
echo Installing Python packages...
pip install -r "%INSTALL_DIR%\requirements.txt" --quiet
echo [OK] Packages installed
echo.

REM ── 5. Install Playwright browser ────────────────────
echo Installing browser (Chromium) - this may take a minute...
python -m playwright install chromium
echo [OK] Browser installed
echo.

REM ── 6. Create desktop launcher (.bat) ────────────────
SET LAUNCHER=%INSTALL_DIR%\launch.bat
(
echo @echo off
echo cd /d "%INSTALL_DIR%"
echo echo.
echo echo ============================================
echo echo   Launching Growisto BSR Scraper...
echo echo   http://localhost:8503
echo echo ============================================
echo echo.
echo start "" "http://localhost:8503"
echo timeout /t 3 /nobreak ^>nul
echo streamlit run app.py --server.port 8503 --server.headless false
) > "%LAUNCHER%"

REM ── 7. Create desktop shortcut (.lnk) ─────────────────
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%DESKTOP%\Growisto BSR Scraper.lnk'); $sc.TargetPath = '%LAUNCHER%'; $sc.WorkingDirectory = '%INSTALL_DIR%'; $sc.Description = 'Growisto BSR Scraper'; $sc.Save()"
echo [OK] Desktop shortcut created: Growisto BSR Scraper
echo.

echo ============================================
echo   Setup complete!
echo.
echo   Double-click the shortcut on your Desktop:
echo   'Growisto BSR Scraper'
echo ============================================
echo.
pause
