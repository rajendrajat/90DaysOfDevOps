## 1. Process Management Commands

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
- `ls` – List files and directories  
- `ls -l` – List files with permissions and ownership  
- `ls -a` – List all files including hidden files (`.` files)  
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

- `ip addr` – Display IP addresses and interfaces  
- `ip route` – Show routing table  
- `ping google.com` – Test network connectivity  
- `curl http://example.com` – Test HTTP/API connectivity  
- `ss -tulnp` – Show listening ports and services  
- `dig google.com` – DNS lookup  

---

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

- `man <command>` – Open official manual page  
- `<command> --help` – Quick usage reference  

---

## Why This Matters for DevOps

- Logs are the **first place to check during incidents**
- Pipes help filter large outputs quickly
- These commands reduce debugging time
- Used daily on production Linux servers

Mastering this toolkit makes Linux predictable and controllable.  

