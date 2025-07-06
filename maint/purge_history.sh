#!/bin/bash


# Variables
#  docker exec -it guacamole-db mysql -u guacamole -p
DOCKER_CONTAINER_NAME="guacamole-db" # Replace with your MySQL Docker container name
MYSQL_USER="guacamole"                 # Replace with your MySQL username
MYSQL_PASSWORD="guacsomethingsecret8888"         # Replace with your MySQL password
MYSQL_DATABASE="guacamole"          # Replace with your MySQL database name
TABLE_NAME="guacamole_connection_history"                         # Table to purge

# Function to purge the history table

purge_history_table() {
    echo "Purging the $TABLE_NAME table in the $MYSQL_DATABASE database..."
    # Run the MySQL command inside the Docker container
    docker exec -i "$DOCKER_CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" <<EOF
DELETE FROM $TABLE_NAME;
EOF
    if [ $? -eq 0 ]; then
        echo "Successfully purged the $TABLE_NAME table."
    else
        echo "Failed to purge the $TABLE_NAME table."
        exit 1
    fi
}

# Call the function
purge_history_table

