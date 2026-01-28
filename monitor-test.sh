#!/bin/bash

PID_FILE="/var/run/monitor_test.pid"
LOG_FILE="/var/log/monitoring.log"

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

if pgrep -x "test" > /dev/null; then
    CURRENT_PID=$(pgrep -x "test" | head -n 1)
    
    if [ -f "$PID_FILE" ]; then
        PREV_PID=$(cat "$PID_FILE")
        if [ "$CURRENT_PID" != "$PREV_PID" ]; then
            log_message "Process 'test' was restarted. New PID: $CURRENT_PID"
        fi
    else
        log_message "Process 'test' started or first check. PID: $CURRENT_PID"
    fi
    
    echo "$CURRENT_PID" > "$PID_FILE"
    
    if ! curl -s -f --head "https://test.com/monitoring/test/api" > /dev/null; then
        log_message "Monitoring server is unavailable"
    fi
fi
