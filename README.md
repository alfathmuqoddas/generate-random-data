# Shell Script for generating random json and sql

## Make the script executable
1. ```chmod +x generate_random_json_array.sh```
2. ```chmod +x generate_random_sql.sh```

## Usage
1. ```$ ./generate_random_json_array.sh <number of json object to be generated>```
2. ```$ ./generate_random_sql.sh <number of json object to be generated>```

## Sample Output
1. JSON ```$ ./generate_random_json_array.sh 3```
   ```
   [
     {
        "id": 1,
        "name": "William",
        "age": 43,
        "email": "william.1@example.com",
        "address": {
            "city": "Seattle",
            "country": "USA"
        },
        "interests": "cooking"
      },
        {
        "id": 2,
        "name": "John",
        "age": 27,
        "email": "john.2@example.com",
        "address": {
            "city": "Los Angeles",
            "country": "USA"
        },
        "interests": "traveling"
      },
      {
        "id": 3,
        "name": "Olivia",
        "age": 37,
        "email": "olivia.3@example.com",
        "address": {
            "city": "Boston",
            "country": "USA"
        },
        "interests": "reading"
      }
    ]
    ```

2. SQL `$ ./generate_random_sql.sh 3`
   ```
    INSERT INTO your_table (name, age, email, city, country, interests) VALUES ('John', 39, 'john.1@example.com', 'Los Angeles', 'USA', 'traveling');
    INSERT INTO your_table (name, age, email, city, country, interests) VALUES ('Bob', 57, 'bob.2@example.com', 'Los Angeles', 'USA', 'painting');
    INSERT INTO your_table (name, age, email, city, country, interests) VALUES ('John', 55, 'john.3@example.com', 'New York', 'USA', 'sports');
   ```
