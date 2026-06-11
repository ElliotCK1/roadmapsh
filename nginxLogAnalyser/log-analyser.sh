#!/usr/bin/env bash
LOG_FILE="$1"

echo "Top 5 IP addresses with the most requests:"
awk '{count[$1]++} END {
    for (ip in count)
        print ip " - " count[ip] " requests"
}' "$LOG_FILE" | sort -k3 -nr | head -5


echo ""
echo "Top 5 most requested paths:"
awk '{count[$7]++} END {
    for (path in count)
        print path " - " count[path] " requests"
}' "$LOG_FILE" | sort -k3 -nr | head -5


echo ""
echo "Top 5 response status codes:"
awk '{count[$9]++} END {
    for (status in count)
        print status " - " count[status] " requests"
}' "$LOG_FILE" | sort -k3 -nr | head -5


echo ""
echo "Top 5 user agents:"
awk -F'"' '{count[$6]++} END {
    for (agent in count)
        print agent " - " count[agent] " requests"
}' "$LOG_FILE" | sort -k3 -nr | head -5