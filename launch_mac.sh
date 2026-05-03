#!/bin/bash
# ─────────────────────────────────────────────────────
#  Growisto BSR Scraper — Launch (Mac)
# ─────────────────────────────────────────────────────

echo ""
echo "============================================"
echo "  Launching Growisto BSR Scraper..."
echo "============================================"
echo ""
echo "  Opening in your browser at:"
echo "  http://localhost:8501"
echo ""
echo "  Press Ctrl+C to stop the app."
echo ""

cd "$(dirname "$0")"
streamlit run app.py --server.port 8501 --server.headless false
