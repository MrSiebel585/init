#!/bin/bash
set -e

LOGFILE="/var/log/install_omniscient_system.log"
exec > >(tee -a "$LOGFILE") 2>&1

# Function to check command success
check_success() {
  if [ $? -ne 0 ]; then
    echo "Error during $1. Check the log file $LOGFILE for details."
    exit 1
  fi
}

echo "[*] Installing Omniscient System Integration..."

# Variables
SERVICE_NAME="omniscient"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"
INSTALL_DIR="/opt/omniscient"
CONFIG_FILE="${INSTALL_DIR}/omniscient.conf"
API_SCRIPT="${INSTALL_DIR}/ai/core_runtime/omniscient_api.py"
LOG_DIR="${INSTALL_DIR}/logs"
USER=$(whoami)

# Create directories
mkdir -p "$INSTALL_DIR/ai/core_runtime"
check_success "creating directory $INSTALL_DIR/ai/core_runtime"
mkdir -p "$LOG_DIR"
check_success "creating log directory $LOG_DIR"

# Move service file
echo "[*] Installing systemd service..."
cp ./omniscient.service "$SERVICE_FILE"
check_success "copying systemd service file"
chmod 644 "$SERVICE_FILE"
check_success "setting permissions on systemd service file"

# Create config file
echo "[*] Creating config file..."
cat <<EOF > "$CONFIG_FILE"
# Omniscient Framework Configuration
MODEL=llama3
API_PORT=8000
LOG_LEVEL=INFO
EOF
check_success "creating config file"

# Reload systemd and enable the service
echo "[*] Enabling and starting Omniscient service..."
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable "$SERVICE_NAME"
systemctl start "$SERVICE_NAME"
check_success "enabling and starting systemd service"

echo "[✓] Omniscient service installed and started."
echo "[i] Config file located at: $CONFIG_FILE"
