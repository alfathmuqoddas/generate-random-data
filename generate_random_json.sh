#!/bin/bash

# Predefined arrays for random data
names=("John" "Alice" "Bob" "Emma" "Michael" "Sophia" "William" "Olivia")
cities=("New York" "Los Angeles" "Chicago" "San Francisco" "Seattle" "Miami" "Dallas" "Boston")
interests=("programming" "reading" "traveling" "cooking" "photography" "painting" "sports")

# Function to generate random data
generate_random_json() {
    local id=$1
    local random_name=${names[$RANDOM % ${#names[@]}]}
    local random_age=$((20 + RANDOM % 40))
    local random_email="${random_name,,}.${id}@example.com"
    local random_city=${cities[$RANDOM % ${#cities[@]}]}
    local random_country="USA"
    local random_interests=${interests[$RANDOM % ${#interests[@]}]}

   # Generate 3 random interests
   # for ((i = 0; i < 3; i++)); do
   #     local random_interest=${interests[$RANDOM % ${#interests[@]}]}
   #     random_interests+=("$random_interest")
   # done

    cat <<EOF >>data.json
{
    "id": $id,
    "name": "$random_name",
    "age": $random_age,
    "email": "$random_email",
    "address": {
        "city": "$random_city",
        "country": "$random_country"
    },
    "interests": "$random_interests"
},
EOF
}

# Check if the user provided the number of JSON objects to generate
if [[ $# -eq 0 ]]; then
    echo "Please provide the number of JSON objects to generate."
    exit 1
fi

# Remove any existing data.json file
rm -f data.json

# Open the JSON array
echo "[" >>data.json

# Generate n JSON objects with random data
for ((i = 1; i <= $1; i++)); do
    generate_random_json $i
done

# Remove the last comma from the last JSON object
sed -i '$ s/,$//' data.json

# Close the JSON array
echo "]" >>data.json

echo "$1 JSON objects with random data have been generated in 'data.json'."
