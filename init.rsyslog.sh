#!/bin/bash

# Function to install Rsyslog service
install_rsyslog() {
    echo "Installing Rsyslog..."
    if [ -f /etc/os-release ]; then
        source /etc/os-release
        if [[ $ID == "ubuntu" || $ID == "debian" ]]; then
            sudo apt-get update
            sudo apt-get install -y rsyslog
        elif [[ $ID == "centos" || $ID == "fedora" ]]; then
            sudo yum install -y rsyslog
        else
            echo "Unsupported Linux distribution. Please install Rsyslog manually."
            exit 1
        fi
    else
        echo "Unknown Linux distribution. Please install Rsyslog manually."
        exit 1
    fi
    echo "Rsyslog installation completed successfully!"
}

# Function to start and enable Rsyslog service
start_enable_rsyslog() {
    echo "Starting and enabling Rsyslog service..."
    if [[ -x "$(command -v systemctl)" ]]; then
        sudo systemctl start rsyslog
        sudo systemctl enable rsyslog
    elif [[ -x "$(command -v service)" ]]; then
        sudo service rsyslog start
        sudo chkconfig rsyslog on
    else
        echo "Unable to determine the service management system. Please start and enable Rsyslog manually."
        exit 1
    fi
    echo "Rsyslog service started and enabled successfully!"
}

# Main script
install_rsyslog
start_enable_rsyslog

# Optionally, you can add configuration modifications here.
# For example, editing /etc/rsyslog.conf or /etc/rsyslog.d/*.conf files.

# Restart Rsyslog service after making configuration changes
if [[ -x "$(command -v systemctl)" ]]; then
    sudo systemctl restart rsyslog
elif [[ -x "$(command -v service)" ]]; then
    sudo service rsyslog restart
fi

echo "Rsyslog installation and configuration completed."

chmod +x install_rsyslog.sh

