set -e
if [ -f "../config/.env"]; then
    set -a
    source "../config/.env"
    set +a
else
    echo "Error: .env file not found in config/" >&2
    exit 1
fi

BACKUP_ROOT="/tmp/quiz_game_backups"
BACKUP_DIR="$BACKUP_ROOT/$(date +%Y-%m-%d_%H-%M-%S)"
PROJECT_DIR="../"
mkdir -p "$BACKUP_DIR"

cp -r "$PROJECT_DIR"/* "$BACKUP_DIR/"

LOG_FILE="$PROJECT_DIR/logs/backup.log"
echo "[$(date)] Backup created at $BACKUP_DIR" >> "$LOG_FILE"
find "$BACKUP_ROOT" -type d -mtime +7 -exec rm -rf {} \;
echo "Backup completed: $BACKUP_DIR"
