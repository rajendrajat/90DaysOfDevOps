# Day 02 – Linux Architecture, Processes, and systemd

## 1. Core Components of Linux

### Kernel

- Core of the Linux operating system
- Talks directly to hardware
- Manages:
  - CPU
  - Memory
  - Processes
  - Devices

### User Space

- Where users and applications run
- Includes:
  - Shell (bash)
  - Commands (`ls`, `ps`, `cd`)
  - Applications and services

### init / systemd

- First process started by the kernel (**PID 1**)
- Controls system startup
- Starts and manages services like `ssh`, `nginx`, `docker`

---

## 2. How Processes Are Created and Managed

### What is a Process?

- A process is a running instance of a program
- Every process has:
  - **PID** (Process ID)
  - **PPID** (Parent Process ID)

### Process Creation

- Parent process creates a child using `fork()`
- Child process loads program using `exec()`

---

## 3. Process States (Important for Troubleshooting)

- **Running (R)**: Process is actively executing on CPU
- **Sleeping (S)**: Waiting for I/O or resource (most common state)
- **Stopped (T)**: Paused manually by user or signal
- **Zombie (Z)**: Process finished execution but parent did not collect exit status

---

## 4. systemd – What It Does and Why It Matters

### What systemd Does

- Manages system startup
- Starts services during boot
- Restarts services if they crash
- Maintains service status and logs

### Why systemd Matters for DevOps

- Ensures services stay running
- Helps in fast recovery during failures
- Used in almost all production Linux servers

```bash
systemctl status ssh
systemctl restart docker
```

## 5. Daily Linux Commands (Used Regularly)

```bash
ps aux            # View all running processes
htop              # Interactive process monitoring
free              # Check memory usage
ip addr           # Check network configuration
systemctl status  # Check service health
```

## 6. Basic File & Directory Commands

```bash
mkdir devops              # Create directory
touch file1.txt           # Create file
cat file1.txt             # View file content
cp file1.txt file2.txt    # Copy file
mv file2.txt devops/      # Move file
```

> **Note**: `mv` does NOT create missing directories. Directory must exist before moving files.

## 7. Linux File System (From / Root)

| Path    | Purpose                        |
| ------- | ------------------------------ |
| `/bin`  | Essential user commands        |
| `/sbin` | System administration commands |
| `/etc`  | Configuration files            |
| `/var`  | Logs and runtime data          |
| `/home` | User directories               |
| `/root` | Root user home                 |

## 8. man Command (RTFM)

```bash
man ps
man systemctl
```

Shows official command documentation. Essential habit for Linux & DevOps engineers.

## Why This Matters for DevOps

Linux is the base OS for almost all production systems. Understanding processes and systemd helps to:

- Debug crashed services faster
- Identify CPU or memory issues
- Read logs confidently
- Reduce downtime during incidents
