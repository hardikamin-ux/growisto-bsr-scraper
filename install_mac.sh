#!/bin/bash
# ─────────────────────────────────────────────────────
#  Growisto BSR Scraper — Mac Installer
#  Run once: bash install_mac.sh
# ─────────────────────────────────────────────────────

set -e

REPO_URL="https://raw.githubusercontent.com/hardikamin-ux/growisto-bsr-scraper/main"
INSTALL_DIR="$HOME/growisto-bsr-scraper"
DESKTOP="$HOME/Desktop"

echo ""
echo "============================================"
echo "  Growisto BSR Scraper — Setup (Mac)"
echo "============================================"
echo ""

# ── 1. Check Python ───────────────────────────────────
if ! command -v python3 &>/dev/null; then
  echo "ERROR: Python 3 is not installed."
  echo "Download it from https://www.python.org/downloads/"
  exit 1
fi
echo "[OK] Python found: $(python3 --version)"

# ── 2. Create install directory ───────────────────────
mkdir -p "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR/.streamlit"
echo "[OK] Install directory: $INSTALL_DIR"

# ── 3. Download all files from GitHub ─────────────────
echo ""
echo "Downloading files..."

files=(
  "app.py"
  "bsr_scraper.py"
  "requirements.txt"
  "BSR_Input_Template.xlsx"
  ".streamlit/config.toml"
)

for f in "${files[@]}"; do
  mkdir -p "$INSTALL_DIR/$(dirname "$f")"
  curl -fsSL "$REPO_URL/$f" -o "$INSTALL_DIR/$f"
  echo "  [OK] $f"
done

# ── 4. Install Python packages ────────────────────────
echo ""
echo "Installing Python packages..."
pip3 install -r "$INSTALL_DIR/requirements.txt" --quiet
echo "[OK] Packages installed"

# ── 5. Install Playwright browser ────────────────────
echo ""
echo "Installing browser (Chromium) — this may take a minute..."
python3 -m playwright install chromium
echo "[OK] Browser installed"

# ── 6. Create desktop shortcut (.command file) ────────
SHORTCUT="$DESKTOP/Growisto BSR Scraper.command"

cat > "$SHORTCUT" <<'SHORTCUT_EOF'
#!/bin/bash
# Growisto BSR Scraper — Launcher
INSTALL_DIR="$HOME/growisto-bsr-scraper"
PORT=8503

echo ""
echo "============================================"
echo "  Launching Growisto BSR Scraper..."
echo "  Opening: http://localhost:8503"
echo "============================================"
echo ""

# Open browser after short delay
(sleep 3 && open "http://localhost:$PORT") &

cd "$INSTALL_DIR"
echo "" | python3 -m streamlit run app.py --server.port $PORT --server.headless false
SHORTCUT_EOF

chmod +x "$SHORTCUT"
echo "[OK] Desktop shortcut created: Growisto BSR Scraper"

# ── Done ──────────────────────────────────────────────
echo ""
echo "============================================"
echo "  Setup complete!"
echo ""
echo "  Double-click the shortcut on your Desktop:"
echo "  'Growisto BSR Scraper.command'"
echo "============================================"
echo ""
