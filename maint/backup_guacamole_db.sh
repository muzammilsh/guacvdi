#!/bin/bash


# Variables
DOCKER_CONTAINER_NAME="guacamole-db"           # MySQL Docker container name
MYSQL_USER="guacamole"                         # MySQL username
MYSQL_PASSWORD="guacsomethingsecret8888"       # MySQL password
MYSQL_DATABASE="guacamole"                     # MySQL database name
BACKUP_DIR="/srv/guacvdi/maint/backup"                   # Directory to store backups
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")             # Timestamp for backup file
BACKUP_FILE="${BACKUP_DIR}/${MYSQL_DATABASE}_backup_${TIMESTAMP}.sql"
LOG_DIR="/srv/guacvdi/maint/logs"
# Ensure backup directory exists

mkdir -p "$BACKUP_DIR"

# Take backup using mysqldump inside the Docker container
echo "Starting backup of $MYSQL_DATABASE database..."
docker exec -i "$DOCKER_CONTAINER_NAME" mysqldump --no-tablespaces -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" > "$BACKUP_FILE"

# Check if the backup was successful
if [ $? -eq 0 ]; then
	    echo "Backup successful: $BACKUP_FILE"
    else
	        echo "Backup failed!"
		    exit 1
fi

# Keep only the 2 most recent backups and delete the rest
echo "Cleaning up old backups..."
ls -tp "$BACKUP_DIR" | grep -v '/$' | tail -n +3 | while read -r FILE; do
    echo "Deleting old backup: $FILE"
        rm -f "$BACKUP_DIR/$FILE"
done

echo "Backup process completed."

# Keep only the 2 most recent logs and delete the rest
echo "Cleaning up old logs..."
ls -tp "$LOG_DIR" | grep -v '/$' | tail -n +3 | while read -r FILE; do
    echo "Deleting old log : $FILE"
        rm -f "$LOG_DIR/$FILE"
done

echo "Housekeeping process completed."
