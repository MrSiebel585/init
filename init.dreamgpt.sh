#!/bin/bash

# Check for Python 3.10+
if ! python3 --version | grep -q "Python 3.10"; then
    echo "Python 3.10 or higher is required."
    exit 1
fi

# Check for Poetry
if ! command -v poetry &> /dev/null; then
    echo "Poetry is not installed. Installing Poetry..."
    curl -sSL https://install.python-poetry.org | python3 -
fi

# Clone the dreamGPT repository
echo "Cloning dreamGPT repository..."
git clone https://github.com/DivergentAI/dreamGPT.git
cd dreamGPT

# Rename .env.example to .env
cp .env.example .env
echo "Renamed .env.example to .env. Please fill in the required API keys."

# Install dependencies
echo "Installing dependencies..."
poetry install

# Instruction for running the script
echo "Installation complete."
echo "To start dreamGPT, run 'poetry run start' inside the dreamGPT directory."
echo "Optionally, to provide a guiding theme, run 'poetry run start --theme \"your theme\"'."
