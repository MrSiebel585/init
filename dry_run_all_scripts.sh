#!/bin/bash
# dry_run_all_scripts.sh
# This script generates a list of all executable scripts in the current directory
# and runs them one by one, logging the output to a file.
# Usage: ./dry_run_all_scripts.sh

# Check if the logs directory exists, if not create it
mkdir -p logs
LOGFILE="logs/script_dryrun.log"
> "$LOGFILE"  # Clear previous log

# Redirect output to the log file and to console
exec > >(tee -a "$LOGFILE") 2>&1

# Loop through all files in the current directory
# and run each executable script, logging the output
for script in *; do
  if [[ -x "$script" && -f "$script" ]]; then
    echo "Running ./$script"
    ./"$script"
    echo "Finished running ./$script"
    echo "----------------------------------------"
  fi
done
