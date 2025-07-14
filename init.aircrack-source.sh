#!/bin/bash
# init.aircrack-source.sh
# Script to install Aircrack-ng from source

set -e  # Exit immediately if a command exits with a non-zero status

echo "Updating package lists..."
sudo apt-get update

echo "Installing required packages..."
sudo apt-get install -y build-essential git libpcap-dev

AIRCRACK_DIR="aircrack-ng"

if [ -d "$AIRCRACK_DIR" ]; then
    echo "Directory $AIRCRACK_DIR already exists. Pulling latest changes..."
    cd "$AIRCRACK_DIR"
    git pull
else
    echo "Cloning Aircrack-ng repository..."
    git clone https://github.com/aircrack-ng/aircrack-ng.git
    cd "$AIRCRACK_DIR"
fi

echo "Configuring build..."
./configure

echo "Building and installing Aircrack-ng..."
make && sudo make install

echo "Aircrack-ng installation completed successfully."
