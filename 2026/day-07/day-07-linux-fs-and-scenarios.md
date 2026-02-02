# Day 07 – Linux File System Hierarchy & Scenario Practice

This document captures Linux filesystem understanding and scenario-based troubleshooting practice.

Environment:
- OS: Ubuntu Linux
- Access: Terminal / SSH

---

# 🔹 Part 1: Linux File System Hierarchy

---

## / (Root Directory)

Contains:  
The top-level directory where the entire Linux filesystem begins.

Observed (ls -l /):
- bin -> usr/bin  
- etc/  
- home/  
- var/

I would use this when  
navigating the system from the base or locating core directories.

📸 Output:

<img width="1774" height="49" alt="image" src="https://github.com/user-attachments/assets/7d4b5270-c48c-4fb2-bf40-a6de159121eb" />

---

## /home

Contains:  
Home directories for regular users storing personal files and scripts.

Observed (ls -l /home):
- ubuntu/  
- user/

I would use this when  
working with user projects or automation scripts.

📸 Output:

<img width="508" height="46" alt="image" src="https://github.com/user-attachments/assets/69ccb263-e74d-4586-a8b8-3ee4160db940" />


---

## /root

Contains:  
Home directory of the root user with admin-level files.

Observed (ls -l /root):
- .bashrc  
- scripts/

I would use this when  
performing administrative tasks as root.

📸 Output:

<img width="723" height="233" alt="image" src="https://github.com/user-attachments/assets/39033fe7-48ba-4153-8b8b-9da77ba496f3" />


---

## /etc

Contains:  
System-wide configuration files for services and networking.

Observed (ls /etc):
- ssh/  
- hostname  
- passwd

I would use this when  
modifying system or service configurations.

📸 Output:

<img width="1858" height="645" alt="image" src="https://github.com/user-attachments/assets/a795433a-7c6b-4e1a-91e3-5df66b428993" />


---

## /var/log

Contains:  
System and service log files.

Observed (ls /var/log):
- syslog  
- auth.log  
- kern.log

I would use this when  
troubleshooting service failures or security events.

📸 Output:

<img width="1625" height="112" alt="image" src="https://github.com/user-attachments/assets/09a8df38-118e-4613-bb27-db1c11a89c2f" />


---

## /tmp

Contains:  
Temporary files created by applications; often cleared on reboot.

Observed (ls /tmp):
- systemd-private-*  
- temp files

I would use this when  
testing scripts or storing temporary data.

📸 Output:

<img width="1603" height="139" alt="image" src="https://github.com/user-attachments/assets/c9a8a3ba-c73a-4d75-9725-829edcf94251" />


---

## /bin

Contains:  
Essential command binaries required for basic operations.

Observed (ls /bin):
- ls  
- cp  
- mv  
- bash

I would use this when  
running fundamental Linux commands.

📸 Output:

<img width="1919" height="947" alt="image" src="https://github.com/user-attachments/assets/f02ad73a-7ffb-47fc-955b-ef39053bf592" />


---

## /usr/bin

Contains:  
User-level command binaries and installed applications.

Observed (ls /usr/bin):
- python3  
- vim  
- ssh  
- systemctl

I would use this when  
running developer or admin tools.

📸 Output:
<img width="1919" height="922" alt="image" src="https://github.com/user-attachments/assets/03b404b3-5fc9-44fd-ab21-87ebbc861e9f" />


---

## /opt

Contains:  
Optional or third-party software installed manually.

Observed (ls /opt):
- custom software folders

I would use this when  
installing external tools like Java or monitoring agents.

📸 Output:

<img width="1032" height="48" alt="image" src="https://github.com/user-attachments/assets/078812b5-d067-4369-bfa4-ac70254efe86" />


---

# 🔹 Hands-on Tasks

## Find large log files

du -sh /var/log/* 2>/dev/null | sort -h | tail -5

<img width="946" height="139" alt="image" src="https://github.com/user-attachments/assets/59c5fbc4-bf92-47aa-b283-5aba8832695e" />
