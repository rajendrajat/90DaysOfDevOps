# Day 04 – Linux Practice: Processes, Services, and Logs

This document captures hands-on Linux practice focused on **process monitoring, service inspection, and log analysis**.

Environment:
- OS: Ubuntu Linux
- Access Method: SSH
- Service inspected: SSH (sshd)

---

# 🔹 Process Commands

## 1. pgrep -a sshd

Explanation:  
Lists running SSH daemon processes along with their command details.

Observations:
- Shows main sshd listener process
- Displays active SSH session processes
- Each login creates a separate process

📸 Output:

<img width="782" height="275" alt="image" src="https://github.com/user-attachments/assets/35bf0650-675c-4f22-8a2e-367ae743c5c9" />


---

## 2. ps aux | grep sshd

Explanation:  
Displays detailed information about SSH processes including user, CPU, and memory usage.

Observations:
- sshd runs as root
- User sessions appear separately
- Confirms active SSH connections

📸 Output:

<img width="1607" height="262" alt="image" src="https://github.com/user-attachments/assets/00eb1b38-77c2-4dc4-8b2b-cf17de8aa83f" />


---

# 🔹 Service Commands

## 3. systemctl status ssh

Explanation:  
Checks SSH service health, uptime, and recent activity.

Observations:
- Service is active and running
- Shows service start time
- Confirms SSH is listening on port 22

📸 Output:

<img width="1484" height="623" alt="image" src="https://github.com/user-attachments/assets/64c2d4ef-52c3-4f5e-bed1-00ae12fa68c6" />


---

## 4. systemctl list-units  --type=service --state=running

Explanation:  
Lists all currently running services managed by systemd.

Observations:
- Shows essential system services
- Confirms system stability
- Useful for quick health checks

📸 Output:

<img width="1416" height="874" alt="image" src="https://github.com/user-attachments/assets/9bb8cfc0-487d-40d5-82d7-7fc0c0d49e0a" />


---

# 🔹 Log Commands

## 5. journalctl -u ssh -n 20

Explanation:  
Displays the most recent SSH service logs.

Observations:
- Shows login attempts
- Displays service start logs
- Useful for troubleshooting SSH issues

📸 Output:

<img width="1640" height="591" alt="image" src="https://github.com/user-attachments/assets/788457a4-3cb8-4b37-a9cd-fe3fd9800141" />


---

## 6. tail -n 20 /var/log/auth.log

Explanation:  
Shows recent authentication logs.

Observations:
- Records SSH login events
- Tracks sudo usage
- Important for security monitoring

📸 Output:

<img width="1655" height="590" alt="image" src="https://github.com/user-attachments/assets/eeee9e75-5796-406f-87e5-030cb1be11a2" />



---

# ✅ Key Learnings

- SSH creates multiple processes per session
- systemctl helps monitor service health
- Logs are critical for troubleshooting
- Process and log checks are daily DevOps tasks
