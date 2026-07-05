set -e

if [ -f "../config/.env" ]; then
    set -a
    source "../config/.env"
    set +a
else
    echo "Error: .env file not found in config/" >&2
    exit 1
fi

WATCH_DIR="../questions"
LOG_FILE="../logs/monitor.log"

touch "$LOG_FILE"

echo "[$(date)] Starting monitor for $WATCH_DIR" >> "$LOG_FILE"
inotifywait -m -r -e modify,create,delete "$WATCH_DIR" | while read dir events file; do
    echo "[$(date)] $events detected in ${dir}${file}" >> "$LOG_FILE"
done
