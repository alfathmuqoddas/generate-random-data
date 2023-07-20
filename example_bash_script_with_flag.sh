#!/bin/bash

# Default values
n=5
output_file="output.txt"

# Function to generate random data for SQL INSERT
generate_random_data() {
    # Your data generation logic here
    # This is just a placeholder function for demonstration
    echo "Generating data..."
}

# Usage function to display script usage
usage() {
    echo "Usage: $0 [-n NUM] [-o FILE]"
    echo "Generate random data and write SQL INSERT statements to a file."
    echo ""
    echo "Options:"
    echo "  -n NUM    Number of rows to generate (default: 5)"
    echo "  -o FILE   Output file name (default: output.txt)"
    exit 1
}

# Parse command-line options using getopts
while getopts ":n:o:" opt; do
    case "$opt" in
        n)
            n=$OPTARG
            ;;
        o)
            output_file=$OPTARG
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument."
            usage
            ;;
    esac
done

# Shift the argument pointer to skip past the processed options
shift $((OPTIND-1))

# Generate SQL INSERT statements and write to the output file
generate_random_data > "$output_file"

echo "$n rows of random data generated and written to $output_file."
