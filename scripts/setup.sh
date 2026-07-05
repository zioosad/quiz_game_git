set -e

if [ -f "../config/.env" ]; then
    set -a
    source "../config/.env"
    set +a
else
    echo "Error: .env file not found in config/" >&2
    exit 1
fi

PROJECT_DIR="../"
QUESTIONS_DIR="../questions"
ANSWERS_DIR="../answers"
LOGS_DIR="../logs"
SCRIPTS_DIR="../scripts"
CONFIG_DIR="../config"

mkdir -p "$QUESTIONS_DIR" "$ANSWERS_DIR" "$LOGS_DIR" "$SCRIPTS_DIR" "$CONFIG_DIR"

for i in {1..5}; do
    touch "$QUESTIONS_DIR/q$i.txt"
    touch "$ANSWERS_DIR/a$i.txt"
    echo "What is the capital of France?" > "$QUESTIONS_DIR/q$i.txt"
    echo "Paris" > "$ANSWERS_DIR/a$i.txt"
done

LOG_FILE="$LOGS_DIR/$(date +%Y-%m-%d).log"
echo "[$(date)] Project structure initialized." >> "$LOG_FILE"
echo "[$(date)] Default questions and answers created." >> "$LOG_FILE"

echo "Setup complete. Project structure:"
tree "$PROJECT_DIR"
