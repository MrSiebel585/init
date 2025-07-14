#!/bin/bash
set -e

LOGFILE="/var/log/init.aliases.installer.log"
exec > >(tee -a "$LOGFILE") 2>&1

# Function to check command success
check_success() {
  if [ $? -ne 0 ]; then
    echo "Error during $1. Check the log file $LOGFILE for details."
    exit 1
  fi
}

# Define installation paths
INSTALL_DIR="/opt/omniscient"
BIN_DIR="$INSTALL_DIR/bin"
GUI_DIR="$INSTALL_DIR/gui"
INIT_DIR="$INSTALL_DIR/init"
README_FILE="$INSTALL_DIR/README.md"
ALIAS_FILE="$INIT_DIR/init.aliases"

# Check if script is being run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "You must run this script as root or with sudo."
  exit 1
fi

# Create necessary directories
echo "Creating necessary directories..."
mkdir -p "$BIN_DIR"
mkdir -p "$GUI_DIR"
mkdir -p "$INIT_DIR"

# Copy files to their locations
echo "Copying files..."
cp omniscientctl "$BIN_DIR/"
cp tkinter_gui.py "$GUI_DIR/"
cp omniscient_menu.sh "$INSTALL_DIR/"
cp init.aliases "$INIT_DIR/"
cp README.md "$README_FILE"

# Set permissions for copied files
echo "Setting file permissions..."
chmod +x "$BIN_DIR/omniscientctl"
chmod +x "$GUI_DIR/tkinter_gui.py"
chmod +x "$INSTALL_DIR/omniscient_menu.sh"

# Set up aliases
echo "Setting up shell aliases..."
BASHRC="$HOME/.bashrc"

# Check if aliases are already sourced
if ! grep -q "$ALIAS_FILE" "$BASHRC"; then
  echo "" >> "$BASHRC"
  echo "# Load Omniscient aliases" >> "$BASHRC"
  echo "source $ALIAS_FILE" >> "$BASHRC"
else
  echo "Aliases are already set in .bashrc"
fi

# Reload .bashrc to activate aliases
echo "Reloading .bashrc..."
source "$BASHRC"

# Display success message
echo "Omniscient installation is complete!"
echo "Please run 'source ~/.bashrc' or restart your terminal to load the aliases."
echo "You can now use Omniscient commands such as 'omniscient', 'omnigui', etc."

