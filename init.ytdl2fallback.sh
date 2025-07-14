#!/bin/bash

# ============================================
# LEGENDARY INSTALLER: youtube-dl & yt-dlp
# ============================================
# An adaptive installer from a future timeline
# that ensures YouTube downloading shall NEVER FAIL.
# ============================================

set -e

# Define a temp working directory
WORK_DIR="$HOME/.local/bin"

# Create the directory if it doesn't exist
mkdir -p "$WORK_DIR"

# Function: Install youtube-dl
install_youtube_dl() {
    echo "[+] Installing youtube-dl..."
    curl -L https://yt-dl.org/downloads/latest/youtube-dl -o "$WORK_DIR/youtube-dl"
    chmod a+rx "$WORK_DIR/youtube-dl"
}

# Function: Install yt-dlp
install_yt_dlp() {
    echo "[+] Installing yt-dlp (the evolved heir)..."
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o "$WORK_DIR/yt-dlp"
    chmod a+rx "$WORK_DIR/yt-dlp"
}

# Function: Test youtube-dl execution
verify_youtube_dl() {
    echo "[+] Verifying youtube-dl functionality..."
    "$WORK_DIR/youtube-dl" --version >/dev/null 2>&1
}

# Start the saga
install_youtube_dl

if verify_youtube_dl; then
    echo "[+] youtube-dl is working perfectly!"
    echo "[+] Add the following to your PATH if not already:"
    echo "    export PATH=\"$WORK_DIR:\$PATH\""
else
    echo "[!] youtube-dl failed to execute. Summoning yt-dlp instead..."
    install_yt_dlp

    echo "[+] yt-dlp is installed! The torch has been passed."
    echo "[+] Add the following to your PATH if not already:"
    echo "    export PATH=\"$WORK_DIR:\$PATH\""

    echo "[+] You can now use 'yt-dlp' as your downloading champion."
fi

# Final victory message
echo "\n[✓] Installation script complete. Download the world, dreamer!"

