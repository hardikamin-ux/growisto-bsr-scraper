@echo off
REM ─────────────────────────────────────────────────────
REM  Growisto BSR Scraper — Launch (Windows)
REM ─────────────────────────────────────────────────────

echo.
echo ============================================
echo   Launching Growisto BSR Scraper...
echo ============================================
echo.
echo   Opening in your browser at:
echo   http://localhost:8501
echo.
echo   Close this window to stop the app.
echo.

cd /d "%~dp0"
streamlit run app.py --server.port 8501 --server.headless false
pause
