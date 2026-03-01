# Day 09 Challenge – Linux User & Group Management

## Users & Groups Created

- **Users:** tokyo, berlin, professor, nairobi
- **Groups:** developers, admins, project-team

---

## Group Assignments

| User      | Groups                      |
|-----------|-----------------------------|
| tokyo     | developers, project-team    |
| berlin    | developers, admins          |
| professor | admins                      |
| nairobi   | project-team                |

**Verification output (`grep` on `/etc/group`):**
```
developers:x:1004:tokyo,berlin
admins:x:1005:berlin,professor
project-team:x:1006:nairobi,tokyo
```

---

## Directories Created

| Directory           | Owner | Group        | Permissions |
|---------------------|-------|--------------|-------------|
| /opt/dev-project    | root  | developers   | 775 (rwxrwxr-x) |
| /opt/team-workspace | root  | project-team | 775 (rwxrwxr-x) |

**Permission breakdown for `775`:**
- Owner (root): `rwx` – read, write, execute
- Group members: `rwx` – read, write, execute
- Others: `r-x` – read and execute only

---

## Commands Used

### Task 1 – Create Users
```bash
useradd -m tokyo
useradd -m berlin
useradd -m professor

echo "tokyo:Tokyo@123" | chpasswd
echo "berlin:Berlin@123" | chpasswd
echo "professor:Prof@123" | chpasswd

# Verify
grep -E "^tokyo:|^berlin:|^professor:" /etc/passwd
ls -la /home/
```

### Task 2 – Create Groups
```bash
groupadd developers
groupadd admins

# Verify
grep -E "^developers:|^admins:" /etc/group
```

### Task 3 – Assign Users to Groups
```bash
usermod -aG developers tokyo
usermod -aG developers,admins berlin
usermod -aG admins professor

# Verify group membership
groups tokyo
groups berlin
groups professor
```

### Task 4 – Shared Directory (dev-project)
```bash
mkdir -p /opt/dev-project
chgrp developers /opt/dev-project
chmod 775 /opt/dev-project

# Verify
ls -ld /opt/dev-project

# Test file creation as tokyo and berlin
su -s /bin/sh -c "touch /opt/dev-project/tokyo-file.txt" tokyo
su -s /bin/sh -c "touch /opt/dev-project/berlin-file.txt" berlin
ls -la /opt/dev-project/
```

### Task 5 – Team Workspace
```bash
useradd -m nairobi
echo "nairobi:Nairobi@123" | chpasswd

groupadd project-team
usermod -aG project-team nairobi
usermod -aG project-team tokyo

mkdir -p /opt/team-workspace
chgrp project-team /opt/team-workspace
chmod 775 /opt/team-workspace

# Test file creation as nairobi
su -s /bin/sh -c "touch /opt/team-workspace/nairobi-file.txt" nairobi
ls -la /opt/team-workspace/
```

---

## Command Quick Reference

| Purpose                      | Command                          |
|------------------------------|----------------------------------|
| Create user with home dir    | `useradd -m <username>`          |
| Set password                 | `echo "user:pass" | chpasswd`    |
| Create group                 | `groupadd <groupname>`           |
| Add user to group(s)         | `usermod -aG <group> <user>`     |
| Check user's groups          | `groups <username>`              |
| Change group owner of dir    | `chgrp <group> <directory>`      |
| Set permissions              | `chmod 775 <directory>`          |
| Run command as another user  | `su -s /bin/sh -c "cmd" <user>`  |
| Verify /etc/passwd           | `grep <username> /etc/passwd`    |
| Verify /etc/group            | `grep <groupname> /etc/group`    |

---

## What I Learned

1. **`-aG` flag is critical** — When using `usermod` to add a user to groups, always use `-aG` (append + group). Without `-a`, the command *replaces* existing group memberships instead of adding to them, which can lock users out of previously assigned groups.

2. **Group permissions enable collaboration** — By setting a directory's group to `developers` and permissions to `775`, all group members can read, write, and execute within the shared directory without needing root access. This is the standard pattern for team workspaces in Linux.

3. **`/etc/passwd` vs `/etc/group` serve different roles** — `/etc/passwd` stores user account info (UID, home dir, shell), while `/etc/group` stores group memberships. A user's *primary group* is in `/etc/passwd`, while *supplementary groups* are listed in `/etc/group`. The `groups` command combines both to show all groups a user belongs to.