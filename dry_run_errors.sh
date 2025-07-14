#!/bin/bash

mkdir -p logs
LOGFILE="logs/script_dryrun_errors.log"
> "$LOGFILE"  # Clear previous log

for script in *.sh; do
  echo "Checking $script ..."
  if ! bash -n "$script" 2>/dev/null; then
    echo "$script: ❌ SYNTAX ERROR" | tee -a "$LOGFILE"
  else
    echo "$script: ✅ OK"
  fi
done

echo -e "\nSummary saved to: $LOGFILE"

