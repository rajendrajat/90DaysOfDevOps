# Day 03 – Linux Command Cheat Sheet (DevOps Toolkit)

This cheat sheet contains frequently used Linux commands for:
- Process management
- File system operations
- Networking troubleshooting

This is a reusable command toolkit for daily DevOps work.

---

## 1. Process Management

- `ps aux` – Show all running processes with CPU and memory usage  
- `ps a` – Show processes associated with the terminal  
- `ps aux | grep nginx` – Find a specific running process  
- `top` – Real-time CPU and memory monitoring  
- `htop` – Interactive process viewer  
- `kill <PID>` – Gracefully stop a process  
- `kill -9 <PID>` – Force kill a process (use carefully)  
- `uptime` – Show system running time and load average  
- `free -h` – Display memory usage in human-readable format  
- `systemctl status <service>` – Check service status  
- `systemctl restart <service>` – Restart a service  

---

## 2. File System Commands

- `pwd` – Show current working directory  
- `ls -l` – List files with permissions and ownership  
- `ls -lh` – List files with human-readable sizes  
- `cd /path` – Change directory  
- `mkdir devops` – Create a directory  
- `mkdir -p parent/child` – Create nested directories  
- `touch file.txt` – Create an empty file  
- `cat file.txt` – View file contents  
- `cp file1.txt file2.txt` – Copy a file  
- `mv file1.txt file2.txt` – Move or rename a file  
- `rm file.txt` – Delete a file  
- `df -h` – Show disk usage  

---

## 3. Networking Troubleshooting

- `ip addr` – Display IP addresses and interfaces  
- `ip route` – Show routing table  
- `ping google.com` – Test network connectivity  
- `curl http://example.com` – Test HTTP/API connectivity  
- `ss -tulnp` – Show listening ports and services  
- `dig google.com` – DNS lookup  

---

## 4. Help & Documentation

- `man <command>` – Open official manual page  
- `<command> --help` – Quick usage reference  

---

## Why This Matters for DevOps

- Faster troubleshooting during incidents  
- Better understanding of system health  
- Reduced downtime in production  
- Strong foundation for automation and scripting  

Mastering these commands makes Linux predictable and controllable.
