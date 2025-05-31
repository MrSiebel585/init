#!/bin/bash

# Exit on any error
set -e

# Create a virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
  echo "Creating virtual environment..."
  python3 -m venv venv
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Install or upgrade gorilla-cli
echo "Installing or upgrading gorilla-cli..."
pip install --upgrade gorilla-cli

# Run gorilla to verify
echo "Running gorilla..."
gorilla
