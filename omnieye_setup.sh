#!/bin/bash

OMNIEYE_DIR="/opt/omniscient/omnieye"
BIN_DIR="/usr/local/bin"

declare -A FILE_MAP=(
  # Core scrapers
  ["site_scraper.py"]="core"
  ["google_proxy_scraper.py"]="core"
  ["ai_scraping_google_proxy.py"]="core"
  ["ai_scraping_google_proxy2.py"]="core"
  ["bulk_searcher.py"]="core"
  ["scrape_everything.sh"]="core"
  ["scrape_mp3.py"]="core"
  ["linkedin_osint.py"]="core"
  # Wrappers
  ["omniscient_omnieye_menu.bash"]="wrappers"
  ["url_queue_processor.sh"]="wrappers"
  ["start_httrack.sh"]="wrappers"
  ["textbrowser"]="wrappers"
  ["sh2sql_menu"]="wrappers"
  # Modules
  ["mech_soup.py"]="modules"
  ["sidemodules.py"]="modules"
  ["scraper_addresses.py"]="modules"
  ["curlstream.py"]="modules"
  ["squid_rotate_proxy"]="modules"
  ["ddgs"]="modules"
  # Integration
  ["markdown_exporter.py"]="integration"
  ["scrape2sql"]="integration"
  ["googlescrape2sql"]="integration"
  ["google_scrape_csv"]="integration"
  ["url2pdf2"]="integration"
  ["url_search_url_index.py"]="integration"
  # Skip logic
  ["omni_skip.sh"]="skiplogic"
  ["omni_skip_regex.sh"]="skiplogic"
)

# Create subdirectories if they don't exist
for sub in core wrappers modules integration skiplogic logs output; do
  mkdir -p "$OMNIEYE_DIR/$sub"
done

# Move files into their subdirectories
for file in "${!FILE_MAP[@]}"; do
  if [ -f "$OMNIEYE_DIR/$file" ]; then
    mv "$OMNIEYE_DIR/$file" "$OMNIEYE_DIR/${FILE_MAP[$file]}/"
    echo "Moved $file -> ${FILE_MAP[$file]}"
  fi
done

# Create symlinks in /usr/local/bin
ln -sf "$OMNIEYE_DIR/wrappers/omniscient_omnieye_menu.bash" "$BIN_DIR/omniscient-scrape-menu"
ln -sf "$OMNIEYE_DIR/core/scrape_everything.sh" "$BIN_DIR/omniscient-scrape-all"
ln -sf "$OMNIEYE_DIR/core/scrape_mp3.py" "$BIN_DIR/omniscient-scrape-mp3"
ln -sf "$OMNIEYE_DIR/core/site_scraper.py" "$BIN_DIR/omniscient-sitescraper"
ln -sf "$OMNIEYE_DIR/core/google_proxy_scraper.py" "$BIN_DIR/omniscient-google"
ln -sf "$OMNIEYE_DIR/integration/markdown_exporter.py" "$BIN_DIR/omniscient-export"

echo "[✓] Omnieye auto-organization and registration complete."
