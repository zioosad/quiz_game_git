#!/bin/bash
set -e

# Load environment variables
if [ -f "../config/.env" ]; then
    set -a
    source "../config/.env"
    set +a
else
    echo "Error: .env file not found in config/" >&2
    exit 1
fi

# Define directories
PROJECT_DIR="../"
LOG_FILE="$PROJECT_DIR/logs/deploy.log"

# Log deployment start
echo "[$(date)] Deployment started" >> "$LOG_FILE"

# Run tests
echo "[$(date)] Running tests..." >> "$LOG_FILE"
if [ -f "$PROJECT_DIR/questions/q1.txt" ]; then
    echo "[$(date)] Test PASS: q1.txt exists" >> "$LOG_FILE"
else
    echo "[$(date)] Test FAIL: q1.txt missing" >> "$LOG_FILE"
    exit 1
fi

# Simulate deployment (e.g., push to GitHub)
echo "[$(date)] Simulating deployment..." >> "$LOG_FILE"
git add "$PROJECT_DIR"
git commit -m "Automated deployment: $(date)"
git push origin main

echo "[$(date)] Deployment completed" >> "$LOG_FILE"
echo "Deployment successful!"
