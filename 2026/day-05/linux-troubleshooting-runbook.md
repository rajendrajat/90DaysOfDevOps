# Day 05 – Linux Troubleshooting Drill: CPU, Memory, and Logs

This document captures a focused troubleshooting drill to assess system health and inspect a running service.

Environment:
- OS: Ubuntu Linux
- Access: Terminal / SSH
- Service inspected: nginx

---

# 🔹 Environment Basics

## 1. uname -a

Explanation:  
Displays kernel and system information.

Observations:
- Confirms system architecture
- Verifies kernel version

📸 Output:

<img width="1448" height="44" alt="image" src="https://github.com/user-attachments/assets/364a40bd-4b10-4828-ace2-7616efbf8ab2" />


---

## 2. cat /etc/os-release

Explanation:  
Shows OS name and version details.

Observations:
- Confirms Linux distribution
- Helps during compatibility checks

📸 Output:

<img width="1000" height="287" alt="image" src="https://github.com/user-attachments/assets/60945854-9447-49c5-8481-eb9a67c235ce" />


---

# 🔹 CPU & Memory Checks

## 3. top

Explanation:  
Provides real-time view of CPU and memory usage.

Observations:
- CPU usage within safe range
- No heavy process consuming resources

📸 Output:

<img width="1109" height="978" alt="image" src="https://github.com/user-attachments/assets/493c0159-d3ac-46ce-96eb-a694faead13b" />


---

## 4. free -h

Explanation:  
Displays system memory usage in human-readable format.

Observations:
- Memory usage stable
- Sufficient free memory available

📸 Output:

<img width="959" height="88" alt="image" src="https://github.com/user-attachments/assets/67dcdc51-9227-4f7b-bd47-16679f01c95b" />


---

# 🔹 Disk & I/O Checks

## 5. df -h

Explanation:  
Shows disk space usage across filesystems.

Observations:
- Disk usage below critical threshold
- No partition near full capacity

📸 Output:

<img width="671" height="359" alt="image" src="https://github.com/user-attachments/assets/6167ae50-d20d-47af-9d90-806b2503d3d2" />


---

## 6. du -sh /var/log

Explanation:  
Checks size of log directory.

Observations:
- Log size under control
- No abnormal log growth

📸 Output:
<img width="617" height="48" alt="image" src="https://github.com/user-attachments/assets/2269af8a-757e-4ee1-9a01-53f7ac75d82a" />


---

# 🔹 Network Checks

## 7. ss -tulpn | grep nginx

Explanation:  
Verifies nginx listening ports.

Observations:
- Nginx listening on port 80
- Service reachable

📸 Output:

<img width="1901" height="105" alt="image" src="https://github.com/user-attachments/assets/b554681d-3674-4cd7-8e8a-79987e8ac526" />


---

## 8. curl -I http://localhost

Explanation:  
Tests HTTP response from nginx.

Observations:
- HTTP 200 response received
- Web service responding correctly

📸 Output:
 
 <img width="661" height="236" alt="image" src="https://github.com/user-attachments/assets/99400b22-cc8e-46a1-ab2b-37a9a88f0024" />


---

# 🔹 Log Checks

## 9. journalctl -u nginx -n 20

Explanation:  
Displays recent nginx service logs.

Observations:
- No recent critical errors
- Normal startup messages

📸 Output:

<img width="1426" height="296" alt="image" src="https://github.com/user-attachments/assets/13b87c73-5c89-4e85-964b-8a51c0a63b2c" />


---

## 10. tail -n 20 /var/log/nginx/error.log

Explanation:  
Shows latest nginx error logs.

Observations:
- No major errors detected
- Service operating normally

📸 Output:

<img width="809" height="54" alt="image" src="https://github.com/user-attachments/assets/7cb07758-e58b-4bcf-b536-b7486d3532df" />


---

# ✅ Quick Findings

- Nginx service running normally
- CPU and memory usage stable
- Disk space healthy
- Network connectivity working
- Logs show no critical issues

---

# ✅ SOP Mindset

- Capture system state before making changes
- Check resources first
- Verify service health
- Review logs before restart
- Act only after evidence

---

# ✅ Why This Matters

Incidents rarely come with perfect clues.  
A fast, repeatable checklist saves minutes when services misbehave.

This drill builds:

- Habit of capturing evidence before acting  
- Confidence reading resource signals  
- Log-first mindset before restarts  
- Reduced downtime and guesswork
