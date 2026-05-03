# 📊 Growisto BSR Scraper

A web-based tool to scrape **Amazon Best Seller Rank (BSR)** data for multiple ASINs across 12 marketplaces — no APIs, no third-party services, pure browser automation.

---

## ✨ Features

- **12 Marketplaces** — US, UK, DE, IN, CA, AU, FR, ES, IT, JP, MX, AE
- **Bulk scraping** — paste ASINs or upload a branded Excel template
- **Live progress** — real-time log, progress bar, and stat tiles while scraping
- **Inline results** — view BSR data directly in the browser
- **Branded Excel output** — Growisto-styled report ready to share
- **Password protected** — single-password login screen

---

## 🚀 Quick Start

### Mac

```bash
# 1. Install (first time only)
double-click  install_mac.sh
# or in terminal:
bash install_mac.sh

# 2. Launch
bash launch_mac.sh
```

### Windows

```
1. Double-click  install_windows.bat   (first time only)
2. Double-click  launch_windows.bat
```

The app opens at **http://localhost:8503**

**Password:** `Growisto@2026`

---

## 📋 Requirements

- Python 3.9+
- Internet connection (to reach Amazon)

All Python packages are installed automatically by the installer scripts.

---

## 📁 File Structure

```
BSR Scrapper/
├── app.py                   # Streamlit web app (UI)
├── bsr_scraper.py           # Core scraper engine (Playwright)
├── requirements.txt         # Python dependencies
├── BSR_Input_Template.xlsx  # Pre-built input template
├── install_mac.sh           # Mac installer
├── launch_mac.sh            # Mac launcher
├── install_windows.bat      # Windows installer
├── launch_windows.bat       # Windows launcher
└── .streamlit/
    └── config.toml          # Theme + port config
```

---

## 🗂️ How to Use

1. Open the app and sign in
2. **Paste ASINs** (one per line) and select a marketplace, **or**
3. **Download the template**, fill in ASINs + marketplace codes, then upload
4. Click **Run Scraper** — a Chrome window opens automatically and scrapes each page
5. View results inline, then **download** the Growisto-branded Excel report

---

## 🌍 Supported Marketplaces

| Code | Domain | Country |
|------|--------|---------|
| US | amazon.com | United States |
| UK | amazon.co.uk | United Kingdom |
| DE | amazon.de | Germany |
| IN | amazon.in | India |
| CA | amazon.ca | Canada |
| AU | amazon.com.au | Australia |
| FR | amazon.fr | France |
| ES | amazon.es | Spain |
| IT | amazon.it | Italy |
| JP | amazon.co.jp | Japan |
| MX | amazon.com.mx | Mexico |
| AE | amazon.ae | UAE |

---

## ⚙️ Manual Setup (without installer scripts)

```bash
pip install -r requirements.txt
python -m playwright install chromium
streamlit run app.py --server.port 8503
```

---

*Built for Growisto — Amazon Ads Agency*
