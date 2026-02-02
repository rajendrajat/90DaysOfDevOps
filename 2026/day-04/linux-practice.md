<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> bf70314 (Revise Linux practice document for processes and logs)
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
<<<<<<< HEAD
=======
**top is a Linux command used for real-time system monitoring. It shows CPU usage, memory usage, and running processes.**
<img width="1098" height="637" alt="image" src="https://github.com/user-attachments/assets/9215fe88-f410-4e23-a5ec-e87a1490e59e" />
<img width="306" height="82" alt="image" src="https://github.com/user-attachments/assets/11bf83bc-b452-43bf-a8c6-1a05bea91203" />
<img width="862" height="117" alt="image" src="https://github.com/user-attachments/assets/18b4f3db-2a46-4708-b9e3-d8cb320e4dc1" />
<img width="813" height="761" alt="image" src="https://github.com/user-attachments/assets/c55366de-3153-44d9-93a9-6f2bdcba435f" />
<img width="1217" height="1017" alt="image" src="https://github.com/user-attachments/assets/363ada50-f7c6-4422-8a56-087bd6298b7f" />
<img width="1892" height="378" alt="image" src="https://github.com/user-attachments/assets/6c638181-8074-4720-9adc-34e01567e619" />
>>>>>>> 88d0a9f (Add Linux command usage details to linux-practice.md)
=======
>>>>>>> bf70314 (Revise Linux practice document for processes and logs)
