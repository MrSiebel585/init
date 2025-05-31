#!/bin/bash

set -e

INSTALL_DIR="/opt/omniscient"
NGROK_BIN="$INSTALL_DIR/ngrok"
ARCH=$(uname -m)

echo "[+] Installing ngrok to $INSTALL_DIR..."

# Determine architecture
if [[ "$ARCH" == "x86_64" ]]; then
    NGROK_URL="https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-stable-linux-amd64.zip"
elif [[ "$ARCH" == "aarch64" ]]; then
    NGROK_URL="https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-stable-linux-arm64.zip"
else
    echo "[!] Unsupported architecture: $ARCH"
    exit 1
fi

# Ensure destination directory exists
sudo mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# Download and extract ngrok
echo "[+] Downloading ngrok..."
curl -sSL "$NGROK_URL" -o ngrok.zip

echo "[+] Extracting ngrok..."
unzip -o ngrok.zip >/dev/null
rm ngrok.zip

# Make it executable
chmod +x ngrok

# Prompt for auth token
read -p "Enter your ngrok authtoken (leave blank to skip): " NGROK_TOKEN

if [[ -n "$NGROK_TOKEN" ]]; then
    echo "[+] Configuring authtoken..."
    "$NGROK_BIN" config add-authtoken "$NGROK_TOKEN"
else
    echo "[!] Skipping authtoken configuration. You can add it later with:"
    echo "    $NGROK_BIN config add-authtoken <token>"
fi

# Optional: add to PATH
if ! grep -q "$INSTALL_DIR" <<< "$PATH"; then
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> ~/.bashrc
    echo "[+] Added $INSTALL_DIR to PATH in ~/.bashrc (reload shell to apply)"
fi

# Verify installation
echo -n "[✓] ngrok version: "
"$NGROK_BIN" version

echo "[✓] ngrok installed successfully in $INSTALL_DIR"

