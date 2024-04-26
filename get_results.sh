#!/bin/bash

# The directory to start from
startdir="$1"

# The file to write the results to
outfile="results.txt"

# Empty the outfile
> "$outfile"

# Loop over all subdirectories
for dir in "$startdir"/*; do
    # Check if it's a directory
    if [ -d "$dir" ]; then
        # Get the directory name
        dirname=$(basename "$dir")

        # Check if the JSON file exists
        if [ -f "$dir/eval_results.json" ]; then
            # Get the accuracy value and convert it to percentage
            accuracy=$(jq '.eval_accuracy' "$dir/eval_results.json")
            accuracy=$(echo "$accuracy * 100" | bc -l | xargs printf "%.1f")

            # Write the results to the outfile
            echo "$dirname: $accuracy" >> "$outfile"
        fi
    fi
done