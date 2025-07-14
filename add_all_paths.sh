#!/bin/bash

# Initialize an empty string to hold the new PATH entries
new_paths=""

# Find all executable .sh files under /opt/omniscient
while IFS= read -r -d '' script; do
    dir=$(dirname "$script")
    # Check if the directory is already in new_paths
    if [[ ":$new_paths:" != *":$dir:"* ]]; then
        new_paths="${new_paths}:${dir}"
    fi
done < <(find /opt/omniscient -type f -name "*.sh" -executable -print0)

# Remove leading colon
new_paths=${new_paths#:}

# Export the updated PATH
export PATH="${PATH}:${new_paths}"

