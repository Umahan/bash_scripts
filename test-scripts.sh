#!/usr/bin/env bash



set -u

LOG="/var/log/monitoring.log"
STATE_DIR="/var/lib/monitoring_test"
STATE_FILE="$STATE_DIR/state"
URL="https://test.com/monitoring/test/api"
CURL_TIMEOUT=10

# ensure directories
mkdir -p "$STATE_DIR"
# ensure log exists and is writable 
touch "$LOG" 2>/dev/null || {
    echo "$(date -Iseconds) [ERROR] Cannot touch $LOG (permissions)." >&2
    exit 1
}

# get PIDs of processes with exact name 'test'
# pgrep -x return PID list by one strng
PIDS=$(pgrep -x test || true)

if [ -n "$PIDS" ]; then
    # compare curent PID with we had
    current_pids="$PIDS"
    prev_pids=""
    if [ -f "$STATE_FILE" ]; then
        prev_pids=$(cat "$STATE_FILE" 2>/dev/null || true)
    fi

    if [ "$current_pids" != "$prev_pids" ]; then
        if [ -n "$prev_pids" ]; then
            echo "$(date -Iseconds) [INFO] process 'test' restarted: previous_pids=[$prev_pids] now_pids=[$current_pids]" >> "$LOG"
        fi
        printf "%s" "$current_pids" > "$STATE_FILE"
    fi
    
    http_code=""
    if ! http_code=$(curl -s -S -o /dev/null -w "%{http_code}" --max-time $CURL_TIMEOUT --retry 2 --retry-delay 2 "$URL"); then
        echo "$(date -Iseconds) [ERROR] monitoring server not reachable at $URL" >> "$LOG"
        exit 0
    fi

    case "$http_code" in
        2??)
            ;;
        *)
            echo "$(date -Iseconds) [ERROR] monitoring server returned HTTP $http_code for $URL" >> "$LOG"
            ;;
    esac

else
    exit 0
fi

exit 0

