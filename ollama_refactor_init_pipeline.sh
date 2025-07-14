#!/bin/bash
# Author: @mrubuntuman - ForwardFartherFaster
# Title: Ollama Script Refactoring Pipeline
# Location: /opt/omniscient/init/init.ollama_refactor_pipeline.sh

# SETTINGS
INPUT_DIR="/opt/omniscient/init"
OUTPUT_DIR="/opt/omniscient/init_refactored"
LOG_FILE="$OUTPUT_DIR/refactor_log.txt"
OLLAMA_MODEL="codellama"  # Change to your model (e.g. smolllm, wizardcoder)

# Ensure output dir exists
mkdir -p "$OUTPUT_DIR"

echo "[+] Refactor job started: $(date)" > "$LOG_FILE"

# MAIN LOOP
for script in "$INPUT_DIR"/init*; do
    [ -f "$script" ] || continue  # skip dirs

    echo "[+] Refactoring: $(basename "$script")" | tee -a "$LOG_FILE"

    # Send script content to Ollama
    RESPONSE=$(ollama run "$OLLAMA_MODEL" <<EOF
You are a code refactoring assistant. Please clean up, standardize, and improve readability of the following Bash script. Keep logic intact. Output only the improved script content.

--- BEGIN SCRIPT ---
$(cat "$script")
--- END SCRIPT ---
EOF
)

    # Clean output and save
    outfile="$OUTPUT_DIR/$(basename "$script")"
    echo "$RESPONSE" > "$outfile"

    echo "[✔] Saved refactored script to: $outfile" | tee -a "$LOG_FILE"
done

echo "[✓] All scripts processed." | tee -a "$LOG_FILE"

