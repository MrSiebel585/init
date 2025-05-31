#!/bin/bash
set -e

INSTALL_DIR="/opt/singularity"
BIN_DIR="$INSTALL_DIR/bin"
SCRIPT_DIR="$INSTALL_DIR/scripts"
LOG_DIR="$INSTALL_DIR/var/log"
SERVICE_FILE="/etc/systemd/system/singularity-ai.service"

function install_singularity() {
  echo "[*] Installing Singularity..."
  mkdir -p "$BIN_DIR" "$SCRIPT_DIR" "$LOG_DIR"

  echo "[*] Writing CLI..."
  cat <<EOF > "$BIN_DIR/devcli"
#!/bin/bash
echo 'Singularity CLI Installed. Use wisely.'
EOF
  chmod +x "$BIN_DIR/devcli"

  echo "[*] Writing AI Module..."
  mkdir -p "$INSTALL_DIR/lib/ai"
  cat <<EOF > "$INSTALL_DIR/lib/ai/init_ai.sh"
#!/bin/bash
echo '[AI] CodeLlama + WhiteRabbit bootstrapped.'
EOF
  chmod +x "$INSTALL_DIR/lib/ai/init_ai.sh"

  echo "[*] Writing .env..."
  cat <<EOF > "$INSTALL_DIR/.env"
PROJECT_ENV=production
PROJECT_NAME=SingularityFramework
EOF

  echo "[*] Creating systemd service..."
  cat <<EOF > "$SERVICE_FILE"
[Unit]
Description=Singularity AI Module
After=network.target

[Service]
ExecStart=$INSTALL_DIR/lib/ai/init_ai.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

  systemctl daemon-reexec
  systemctl daemon-reload
  systemctl enable singularity-ai
  systemctl start singularity-ai

  echo "[✓] Singularity installed at $INSTALL_DIR"
}

function uninstall_singularity() {
  echo "[!] Uninstalling Singularity..."
  systemctl stop singularity-ai || true
  systemctl disable singularity-ai || true
  rm -f "$SERVICE_FILE"
  systemctl daemon-reload
  rm -rf "$INSTALL_DIR"
  echo "[✓] Singularity removed."
}

function update_singularity() {
  echo "[*] Updating Singularity CLI and AI module..."
  echo "#!/bin/bash
echo 'Updated CLI!'" > "$BIN_DIR/devcli"
  chmod +x "$BIN_DIR/devcli"
  echo "#!/bin/bash
echo '[AI] Module updated!'" > "$INSTALL_DIR/lib/ai/init_ai.sh"
  chmod +x "$INSTALL_DIR/lib/ai/init_ai.sh"
  systemctl restart singularity-ai
  echo "[✓] Update complete."
}

case "$1" in
  install) install_singularity ;;
  uninstall) uninstall_singularity ;;
  update) update_singularity ;;
  *) echo "Usage: $0 {install|uninstall|update}" ;;
esac
