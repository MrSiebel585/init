#!/bin/bash
# This script generates a list of all executable scripts in the current directory
# and runs them one by one, logging the output to a file.
# Usage: ./auto_run.sh
# Check if the logs directory exists, if not create it


for script in *; do
  if [[ -x "$script" && -f "$script" ]]; then
    echo "=== Running: $script ==="
    ./"$script"
    echo "=== Done: $script ==="
  fi
done
