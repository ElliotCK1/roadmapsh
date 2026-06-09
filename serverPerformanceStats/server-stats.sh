#!/bin/bash

# Variables
total_cpu=$(top -bn1 | grep 'Cpu(s)' | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' | awk '{print 100 - $1"%"}')
total_memory_usage=$(free -m | awk 'NR==2{printf "Used: %dMB (%.2f%%) | Free: %dMB (%.2f%%)\n", $3, ($3/$2)*100, $7, ($7/$2)*100}')
total_disk_usage=$(df -h -x tmpfs -x devtmpfs)
cpu_processes=$(ps -eo comm,%cpu --sort=-%cpu | head -n 6)
mem_processes=$(ps -eo comm,%mem --sort=-%mem | head -n 6)

# Print results
echo "=== Total CPU Usage ==="
echo "$total_cpu"
echo ""

echo "=== Total Memory Usage ==="
echo "$total_memory_usage"
echo ""

echo "=== Total Disk Usage ==="
echo "$total_disk_usage"
echo ""

echo "=== Top 5 CPU Processes ==="
echo "$cpu_processes"
echo ""

echo "=== Top 5 Memory Processes ==="
echo "$mem_processes"