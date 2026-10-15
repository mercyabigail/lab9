#!/bin/bash
# Pulls the latest code from GitHub into the web folder and logs the result
set -euo pipefail

REPO_DIR="/var/www/lab9demo"
BRANCH="main"
LOG_FILE="/var/log/deploy-lab9demo.log"

cd "$REPO_DIR"
echo "[$(date '+%F %T')] Deploy started" >> "$LOG_FILE"

git fetch origin "$BRANCH" >> "$LOG_FILE" 2>&1
git reset --hard "origin/$BRANCH" >> "$LOG_FILE" 2>&1

echo "[$(date '+%F %T')] Deploy finished at commit $(git rev-parse --short HEAD)" >> "$LOG_FILE"
