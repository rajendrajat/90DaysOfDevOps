#!/bin/bash

SERVICE="nginx"

echo "===== Service Status ====="
systemctl is-active $SERVICE

echo "===== Detailed Status ====="
systemctl status $SERVICE --no-pager

echo "===== Logs ====="
journalctl -u $SERVICE -n 50 --no-pager

echo "===== Process ====="
ps aux | grep $SERVICE | grep -v grep

echo "===== Disk ====="
df -h | grep -v tmpfs

echo "===== Permissions ====="
ls -l /var/www/