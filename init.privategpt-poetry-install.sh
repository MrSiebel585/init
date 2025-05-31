#!/bin/bash

# Exit immediately on error
set -e

# Configurable repo
REPO_URL="https://github.com/imartinez/privateGPT.git"
FOLDER_NAME="privateGPT"

# Clone the repo if it doesn't exist
if [ ! -d "$FOLDER_NAME" ]; then
  echo "Cloning privateGPT repository..."
  git clone $REPO_URL
fi

cd $FOLDER_NAME

# Check if Poetry is installed
if ! command -v poetry &> /dev/null; then
  echo "Poetry not found. Please install Poetry first: https://python-poetry.org/docs/#installation"
  exit 1
fi

# Install dependencies using Poetry
echo "Installing dependencies with Poetry..."
poetry install

# Activate the virtual environment and run the CLI
echo "Running privateGPT CLI..."
poetry run python privategpt.py
