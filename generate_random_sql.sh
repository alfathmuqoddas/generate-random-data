#!/bin/bash

# Function to generate random data for SQL INSERT
generate_random_data() {
    names=("John" "Alice" "Bob" "Emma" "Michael" "Sophia" "William" "Olivia")
    cities=("New York" "Los Angeles" "Chicago" "San Francisco" "Seattle" "Miami" "Dallas" "Boston")
    interests=("programming" "reading" "traveling" "cooking" "photography" "painting" "sports")

    random_name=${names[$RANDOM % ${#names[@]}]}
    random_age=$((20 + RANDOM % 40))
    random_email="${random_name,,}.${1}@example.com"
    random_city=${cities[$RANDOM % ${#cities[@]}]}
    random_country="USA"
    random_interest=${interests[$RANDOM % ${#interests[@]}]}

    # Generate 3 random interests
    #random_interests=()
    #for ((i = 0; i < 3; i++)); do
    #    random_interest=${interests[$RANDOM % ${#interests[@]}]}
    #    random_interests+=("$random_interest")
    #done
    
    cat <<EOF >> data.sql
    INSERT INTO your_table (name, age, email, city, country, interests) VALUES ('$random_name', $random_age, '$random_email', '$random_city', '$random_country', '$random_interest');
EOF
}

# Check if the user provided the number of SQL objects to generate
if [[ $# -eq 0 ]]; then
    echo "Please provide the number of SQL data to generate."
    exit 1
fi

# Remove any existing data.json file
rm -f data.sql

# Number of rows to generate
n=$1

# Generate SQL INSERT statements for n rows
for ((i = 1; i <= n; i++)); do
    generate_random_data $i
done

echo "$1 SQL insert statement with random data have been generated in 'data.sql'."
