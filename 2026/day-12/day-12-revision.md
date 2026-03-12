# Day 12 – Breather & Revision (Days 01–11)

**Date:** 2026-03-12  
**Time Spent:** ~40 minutes  
**Goal:** Consolidate fundamentals from Days 01–11 without introducing new concepts.

---

## 🔁 Mindset & Plan Review (Day 01 Revisit)

- Original goal: Build a solid Linux foundation for DevOps
- **Still on track** — the progression from processes → files → permissions → users is logical
- Tweak: Spend more time practicing `chmod` with numeric notation — still slightly shaky
- Next milestone: Automate a simple task using shell scripting (upcoming days)

---

## ⚙️ Processes & Services – Re-run Notes (Days 04–05)

Commands re-run today and observations:

\`\`\`bash
# List all running processes with full detail
ps aux

# Check status of a specific service (e.g., ssh)
systemctl status ssh

# View recent logs for a service
journalctl -u ssh --since "1 hour ago"

# Check top CPU/memory consumers
top
\`\`\`

**Observed today:**
- `ps aux` showed several zombie-state processes — good reminder to monitor those
- `systemctl status ssh` showed `active (running)` — confirmed service is healthy
- `journalctl` is powerful for filtering; `--since` flag saves scrolling through walls of logs

---

## 📁 File Skills Practice (Days 06–11)

Three quick operations re-practiced:

\`\`\`bash
# 1. Append text to a file (echo >>)
echo "Revision note on $(date)" >> revision_log.txt

# 2. Change permissions using numeric notation
chmod 755 myscript.sh
# Means: owner=rwx, group=r-x, others=r-x

# 3. Change ownership of a file
sudo chown devops:devops myscript.sh

# Verify both
ls -l myscript.sh
\`\`\`

**Key reminder:** `chmod 777` is almost never the right answer in production — lazy fix, security nightmare.

---

## 📋 Cheat Sheet Refresh (Day 03) – Top 5 Incident Commands

If something breaks, these are the first 5 I'd reach for:

| # | Command | Why |
|---|---------|-----|
| 1 | `systemctl status <service>` | Instantly tells if the service is up/down/failed |
| 2 | `journalctl -u <service> -n 50` | Last 50 log lines — usually shows the error |
| 3 | `ps aux \| grep <process>` | Confirm if a process is actually running |
| 4 | `df -h` | Check if disk is full (silent killer of services) |
| 5 | `ls -l` | Quickly spot permission issues on files/dirs |

---

## 👤 User/Group Scenario (Days 09 & 11 Revisit)

\`\`\`bash
# Create a user
sudo useradd -m testuser

# Set a password
sudo passwd testuser

# Add to a group
sudo usermod -aG sudo testuser

# Verify
id testuser

# Change file ownership to this user
sudo chown testuser:testuser /home/testuser/testfile.txt

# Verify ownership
ls -l /home/testuser/testfile.txt
\`\`\`

**Output looked like:**
\`\`\`
-rw-r--r-- 1 testuser testuser 0 Mar 12 2026 testfile.txt
\`\`\`
✅ Ownership confirmed working.

---

## ✅ Mini Self-Check Answers

### 1) Which 3 commands save you the most time right now, and why?

1. **`systemctl status <service>`** — One command to rule service health. Active, failed, logs — all in one shot.
2. **`journalctl -u <service> -n 50`** — When something breaks at 2 AM, this is the fastest way to see *why*.
3. **`ls -l`** — Solves 30% of "why can't I access this file" problems instantly by showing permissions and ownership.

---

### 2) How do you check if a service is healthy? (Exact commands)

\`\`\`bash
# Step 1: Check service status
systemctl status ssh

# Step 2: If it's failed, check recent logs
journalctl -u ssh -n 100 --no-pager

# Step 3 (bonus): Ensure it's enabled to start on boot
systemctl is-enabled ssh
\`\`\`

Look for: `active (running)` = healthy | `failed` or `inactive` = investigate logs immediately.

---

### 3) How do you safely change ownership and permissions without breaking access?

**Rule:** Always check current permissions first with `ls -l`, then change deliberately.

\`\`\`bash
# Safe ownership change
sudo chown www-data:www-data /var/www/html/index.html

# Safe permission change — give owner read/write, group read-only, others nothing
chmod 640 /var/www/html/index.html

# Verify
ls -l /var/www/html/index.html
\`\`\`

⚠️ Never run `chmod 777` on production files. It opens read/write/execute to *everyone*.

---

### 4) What will I focus on improving in the next 3 days?

1. **`chmod` numeric notation** — Still need to get faster at reading `755`, `644`, `600` in my head
2. **`journalctl` filtering flags** — `--since`, `--until`, `-p err` need more practice
3. **Shell scripting basics** — Ready to start combining these commands into small scripts

---

## 🗝️ Key Takeaways from Week 1

- Linux is about knowing **what to look at first** — permissions, processes, logs, disk
- `systemctl` + `journalctl` = the DevOps first-aid kit for services
- File permissions are a security layer, not just a setting — treat them seriously
- Users and groups are how Linux enforces **who can do what** — always verify with `id` and `ls -l`

---

## 🌐 Learn in Public (Post Template)

> Day 12 of #90DaysOfDevOps — took a breather to reinforce Week 1 fundamentals.
>
> Re-ran process checks, service health commands, and file permission changes.
> The command I now remember confidently: `journalctl -u <service> -n 50` — fastest way to diagnose a broken service.
>
> #90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham
