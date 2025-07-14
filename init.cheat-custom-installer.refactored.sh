#!/bin/bash
set -e

LOGFILE="/var/log/init.cheat-custom-installer.log"
exec > >(tee -a "$LOGFILE") 2>&1

# Function to check command success
check_success() {
  if [ $? -ne 0 ]; then
    echo "Error during $1. Check the log file $LOGFILE for details."
    exit 1
  fi
}

# Define the version of cheat to install
CHEAT_VERSION="4.3.1"

# Define the download URL
DOWNLOAD_URL="https://github.com/cheat/cheat/releases/download/${CHEAT_VERSION}/cheat-linux-amd64.gz"

# Step 1: Download the cheat binary
echo "Downloading cheat version ${CHEAT_VERSION}..."
wget $DOWNLOAD_URL -O cheat-linux-amd64.gz
check_success "downloading cheat binary"

# Step 2: Unzip the downloaded file
echo "Unzipping the cheat binary..."
gunzip cheat-linux-amd64.gz
check_success "unzipping cheat binary"

# Step 3: Make the binary executable
echo "Making cheat binary executable..."
chmod +x cheat-linux-amd64
check_success "making cheat binary executable"

# Step 4: Move the binary to a directory in your PATH
echo "Moving cheat binary to /usr/local/bin..."
sudo mv cheat-linux-amd64 /usr/local/bin/cheat
check_success "moving cheat binary to /usr/local/bin"

# Final Step: Verify the installation
echo "Verifying the installation..."
cheat_version_installed=$(cheat -v)

if [[ $cheat_version_installed == *"$CHEAT_VERSION"* ]]; then
    echo "cheat version ${CHEAT_VERSION} successfully installed."
else
    echo "Installation failed. cheat command not found or version mismatch."
    exit 1
fi
