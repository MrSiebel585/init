#!/bin/bash

# Function to install Python
install_python() {
    echo "Installing Python..."

    # For Debian-based systems
    if [ -f /etc/debian_version ]; then
        sudo apt-get update
        sudo apt-get install -y python3

    # For Red Hat-based systems
    elif [ -f /etc/redhat-release ]; then
        sudo yum update -y
        sudo yum install -y python3

    # For MacOS
    elif [ "$(uname)" == "Darwin" ]; then
        brew install python3

    else
        echo "Unsupported operating system."
        exit 1
    fi

    echo "Python installation complete."
}

# Check if Python is already installed
if command -v python3 &>/dev/null; then
    echo "Python is already installed."
else
    install_python
fi
