<<<<<<< HEAD
<<<<<<< HEAD
## 1. Process Management Commands
=======
# Day 03 – Linux Command Cheat Sheet (DevOps Toolkit)

This cheat sheet contains frequently used Linux commands for:
- Process management
- File system operations
- Networking troubleshooting

This is a reusable command toolkit for daily DevOps work.

---

## 1. Process Management
>>>>>>> d8e56fa (day 03: linux-cheat-sheet)
=======
## 1. Process Management Commands
>>>>>>> ec5ce30 (Revise Linux command cheat sheet for clarity and completeness)

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
<<<<<<< HEAD
<<<<<<< HEAD
- `ls` – List files and directories  
- `ls -l` – List files with permissions and ownership  
- `ls -a` – List all files including hidden files (`.` files)  
=======
- `ls -l` – List files with permissions and ownership  
>>>>>>> d8e56fa (day 03: linux-cheat-sheet)
=======
- `ls` – List files and directories  
- `ls -l` – List files with permissions and ownership  
- `ls -a` – List all files including hidden files (`.` files)  
>>>>>>> ec5ce30 (Revise Linux command cheat sheet for clarity and completeness)
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

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ec5ce30 (Revise Linux command cheat sheet for clarity and completeness)
## 3. Pipe Symbol (`|`) – Very Important

- `|` is called a **pipe**
- It sends output of one command as input to another command

### Where and Why to Use Pipe
- To filter output
- To search logs or processes
- To avoid large unreadable output

### Examples
- `ps aux | grep docker` – Find docker process  
- `ls -l | grep ".log"` – Find log files  
- `cat file.txt | grep error` – Search error in file  

---

## 4. Networking Troubleshooting Commands
<<<<<<< HEAD
=======
## 3. Networking Troubleshooting
>>>>>>> d8e56fa (day 03: linux-cheat-sheet)
=======
>>>>>>> ec5ce30 (Revise Linux command cheat sheet for clarity and completeness)

- `ip addr` – Display IP addresses and interfaces  
- `ip route` – Show routing table  
- `ping google.com` – Test network connectivity  
- `curl http://example.com` – Test HTTP/API connectivity  
- `ss -tulnp` – Show listening ports and services  
- `dig google.com` – DNS lookup  

---

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ec5ce30 (Revise Linux command cheat sheet for clarity and completeness)
## 5. Log Checking Commands (Very Important for DevOps)

### Application & System Logs
- `ls /var/log` – List available log files  
- `cat /var/log/syslog` – View system log (Ubuntu/Debian)  
- `cat /var/log/messages` – View system log (RHEL/CentOS)  

### Service Logs (systemd)
- `journalctl` – View all system logs  
- `journalctl -u nginx` – View logs for a specific service  
- `journalctl -xe` – View recent errors  

### Live Log Monitoring
- `tail -f /var/log/syslog` – Watch logs in real time  

---

## 6. Help & Documentation
<<<<<<< HEAD
=======
## 4. Help & Documentation
>>>>>>> d8e56fa (day 03: linux-cheat-sheet)
=======
>>>>>>> ec5ce30 (Revise Linux command cheat sheet for clarity and completeness)

- `man <command>` – Open official manual page  
- `<command> --help` – Quick usage reference  

---

## Why This Matters for DevOps

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ec5ce30 (Revise Linux command cheat sheet for clarity and completeness)
- Logs are the **first place to check during incidents**
- Pipes help filter large outputs quickly
- These commands reduce debugging time
- Used daily on production Linux servers

Mastering this toolkit makes Linux predictable and controllable.  
<<<<<<< HEAD

=======
- Faster troubleshooting during incidents  
- Better understanding of system health  
- Reduced downtime in production  
- Strong foundation for automation and scripting  

Mastering these commands makes Linux predictable and controllable.
>>>>>>> d8e56fa (day 03: linux-cheat-sheet)
=======

>>>>>>> ec5ce30 (Revise Linux command cheat sheet for clarity and completeness)
