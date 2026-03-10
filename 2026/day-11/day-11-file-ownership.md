# Day 11 – File Ownership (chown & chgrp)

> **Challenge:** Master file and directory ownership in Linux using `chown` and `chgrp`

---

## What is File Ownership in Linux?

Every file in Linux has **two ownership attributes**:

| Attribute | Meaning                                           | Real-world Example                        |
| --------- | ------------------------------------------------- | ----------------------------------------- |
| **Owner** | The individual user who created/controls the file | `rajen` owns his home directory files     |
| **Group** | A team of users who share access to the file      | `developers` group can read project files |

When you run `ls -l`, the output looks like:

```
-rw-r--r-- 1 rajen rajen 46 Mar 10 notes.txt
              │     │
              │     └── Group
              └───────── Owner
```

---

## Users & Groups Setup

### Users Present on System

```bash
$ cat /etc/passwd | grep -v nologin
rajen:x:1000:1000:rajen:/home/rajen:/bin/bash
tokyo:x:1001:1001::/home/tokyo:/bin/sh
berlin:x:1002:1002::/home/berlin:/bin/sh
professor:x:1003:1003::/home/professor:/bin/sh
nairobi:x:1004:1004::/home/nairobi:/bin/sh
```

### Groups Created for This Challenge

```bash
sudo groupadd heist-team    # GID 1009
sudo groupadd planners      # GID 1010
sudo groupadd vault-team    # GID 1011
sudo groupadd tech-team     # GID 1012
```

---

## Task 1: Understanding Ownership

```bash
ls -l /home/rajen
```

**Output:**

```
-rw-rw-r-- 1 rajen rajen   0  Mar 10  devops-file.txt
-rw-rw-r-- 1 rajen rajen  46  Mar 10  notes.txt
-rwxr-xr-x 1 rajen rajen  81  Feb 28  sysinfo.sh
drwxrwxr-x 3 rajen rajen  4096 Mar 7  tws10
```

**Key Observations:**

- All files owned by `rajen:rajen` — user and group are the same (typical for personal machines)
- `sysinfo.sh` has execute permission (`x`) — it's a runnable script
- Default permissions on new files are `664` (not `644`) because system `umask` is `002`

> 💡 **Real DevOps scenario:** On a production server, `/var/www/html/` might be owned by `www-data:www-data`. Your deploy script needs to either run as that user or be in that group to update files.

---

## Task 2: chown – Change Owner Only

```bash
# Create file
touch devops-file.txt

# Check initial ownership
ls -l devops-file.txt
# -rw-rw-r-- 1 rajen rajen 0 Mar 10 devops-file.txt

# Change owner to tokyo
sudo chown tokyo devops-file.txt
ls -l devops-file.txt
# -rw-rw-r-- 1 tokyo rajen 0 Mar 10 devops-file.txt

# Change owner to berlin
sudo chown berlin devops-file.txt
ls -l devops-file.txt
# -rw-rw-r-- 1 berlin rajen 0 Mar 10 devops-file.txt
```

**Before → After:**

```
rajen:rajen  →  tokyo:rajen  →  berlin:rajen
```

> ⚠️ Notice: Group stayed as `rajen` — `chown username` only changes the **owner**, not the group.

---

## Task 3: chgrp – Change Group Only

```bash
# Create file
touch team-notes.txt

# Check initial state
ls -l team-notes.txt
# -rw-rw-r-- 1 rajen rajen 0 Mar 10 team-notes.txt

# Change group to heist-team
sudo chgrp heist-team team-notes.txt

# Verify
ls -l team-notes.txt
# -rw-rw-r-- 1 rajen heist-team 0 Mar 10 team-notes.txt
```

**Before → After:**

```
rajen:rajen  →  rajen:heist-team
```

> ⚠️ Notice: Owner stayed as `rajen` — `chgrp` only changes the **group**.

> 💡 **Real DevOps scenario:** A log file owned by `app-user` but group changed to `developers` lets the dev team `tail -f` logs without giving them full ownership of the application files.

---

## Task 4: Combined Owner & Group Change

### File: project-config.yaml

```bash
touch project-config.yaml

# Before
ls -l project-config.yaml
# -rw-rw-r-- 1 rajen rajen 0 Mar 10 project-config.yaml

# Change both owner AND group in one command
sudo chown professor:heist-team project-config.yaml

# After
ls -l project-config.yaml
# -rw-rw-r-- 1 professor heist-team 0 Mar 10 project-config.yaml
```

### Directory: app-logs/

```bash
mkdir app-logs/

# Before
ls -ld app-logs/
# drwxrwxr-x 2 rajen rajen 4096 Mar 10 app-logs/

# Change both owner and group
sudo chown berlin:heist-team app-logs/

# After
ls -ld app-logs/
# drwxrwxr-x 2 berlin heist-team 4096 Mar 10 app-logs/
```

**Summary:**

| Resource              | Before        | After                  |
| --------------------- | ------------- | ---------------------- |
| `project-config.yaml` | `rajen:rajen` | `professor:heist-team` |
| `app-logs/`           | `rajen:rajen` | `berlin:heist-team`    |

> 💡 **Syntax:** `sudo chown owner:group filename` — the `:` separator is what makes it change both at once.

---

## Task 5: Recursive Ownership with -R

```bash
# Create directory structure
mkdir -p heist-project/vault
mkdir -p heist-project/plans
touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf
```

**Before (`ls -lR heist-project/`):**

```
heist-project/:
drwxr-xr-x 2 root root 4096 Mar 10 plans/
drwxr-xr-x 2 root root 4096 Mar 10 vault/

heist-project/plans:
-rw-r--r-- 1 root root 0 Mar 10 strategy.conf

heist-project/vault:
-rw-r--r-- 1 root root 0 Mar 10 gold.txt
```

```bash
# Apply recursive ownership change
sudo chown -R professor:planners heist-project/
```

**After (`ls -lR heist-project/`):**

```
heist-project/:
drwxr-xr-x 2 professor planners 4096 Mar 10 plans/
drwxr-xr-x 2 professor planners 4096 Mar 10 vault/

heist-project/plans:
-rw-r--r-- 1 professor planners 0 Mar 10 strategy.conf

heist-project/vault:
-rw-r--r-- 1 professor planners 0 Mar 10 gold.txt
```

**What `-R` does:**

| Without `-R`                         | With `-R`                                  |
| ------------------------------------ | ------------------------------------------ |
| Only `heist-project/` itself changes | Parent + ALL subfolders + ALL files change |

> ⚠️ **Production Warning:** Never run `sudo chown -R user:group /` or on system directories like `/etc`, `/var`. It will break your entire OS. Always double-check the path!

> 💡 **Real DevOps scenario:** After deploying a Node.js app, you'd run `sudo chown -R nodejs:nodejs /opt/myapp/` so the service process has full ownership of its own files.

---

## Task 6: Practice Challenge – bank-heist/

```bash
# Create structure
mkdir bank-heist
touch bank-heist/access-codes.txt
touch bank-heist/blueprints.pdf
touch bank-heist/escape-plan.txt

# Before
ls -l bank-heist/
# -rw-rw-r-- 1 rajen rajen 0 Mar 10 access-codes.txt
# -rw-rw-r-- 1 rajen rajen 0 Mar 10 blueprints.pdf
# -rw-rw-r-- 1 rajen rajen 0 Mar 10 escape-plan.txt

# Assign different ownership to each file
sudo chown tokyo:vault-team   bank-heist/access-codes.txt
sudo chown berlin:tech-team   bank-heist/blueprints.pdf
sudo chown nairobi:vault-team bank-heist/escape-plan.txt

# Verify
ls -l bank-heist/
```

**Final output:**

```
-rw-rw-r-- 1 tokyo   vault-team 0 Mar 10 access-codes.txt
-rw-rw-r-- 1 berlin  tech-team  0 Mar 10 blueprints.pdf
-rw-rw-r-- 1 nairobi vault-team 0 Mar 10 escape-plan.txt
```

Each file has a **different owner and different group** — exactly as required ✅

---

## Key Commands Reference

```bash
# View ownership of a file
ls -l filename

# View ownership of a directory itself (not contents)
ls -ld dirname/

# View ownership recursively (directory + all contents)
ls -lR dirname/

# Change owner only
sudo chown newowner filename

# Change group only
sudo chgrp newgroup filename

# Change both owner and group (one command)
sudo chown owner:group filename

# Change only group using chown (note the colon before group)
sudo chown :groupname filename

# Recursive change – applies to directory + everything inside
sudo chown -R owner:group directory/

# Create a new user (needed before chown to that user)
sudo useradd username

# Create a new group (needed before chgrp/chown to that group)
sudo groupadd groupname
```

---

## Ownership Changes Summary

| File / Dir                    | Initial       | Final                  |
| ----------------------------- | ------------- | ---------------------- |
| `devops-file.txt`             | `rajen:rajen` | `berlin:rajen`         |
| `team-notes.txt`              | `rajen:rajen` | `rajen:heist-team`     |
| `project-config.yaml`         | `rajen:rajen` | `professor:heist-team` |
| `app-logs/`                   | `rajen:rajen` | `berlin:heist-team`    |
| `heist-project/` (all)        | `root:root`   | `professor:planners`   |
| `bank-heist/access-codes.txt` | `rajen:rajen` | `tokyo:vault-team`     |
| `bank-heist/blueprints.pdf`   | `rajen:rajen` | `berlin:tech-team`     |
| `bank-heist/escape-plan.txt`  | `rajen:rajen` | `nairobi:vault-team`   |

---

## What I Learned

1. **Owner and Group are independent** — `chown` changes owner, `chgrp` changes group. But `chown owner:group` can do both at once. This design lets Linux give fine-grained access: one user owns a file, while a whole team shares read access through group membership — without giving everyone full ownership.

2. **`-R` is powerful but dangerous** — Recursive `chown -R` is a one-shot command to change ownership across hundreds of files instantly. In production this is essential (e.g., deploying apps), but pointing it at the wrong path can silently break system services. Always verify the path before hitting Enter.

3. **Users and groups must exist before you assign them** — `chown tokyo file` fails with `invalid user` if `tokyo` doesn't exist yet. In real DevOps pipelines, user/group provisioning (via Ansible, cloud-init, or Terraform) always happens in the infrastructure layer _before_ application deployment touches file ownership.

---

## Why This Matters for DevOps

| Real Scenario      | Ownership Setup                                         |
| ------------------ | ------------------------------------------------------- |
| Web server files   | `www-data:www-data` — only the web process can write    |
| CI/CD artifacts    | `jenkins:developers` — Jenkins writes, devs can read    |
| App config files   | `app-user:ops-team` — app reads, ops team can edit      |
| Log files          | `app-user:developers` — app writes, devs can tail       |
| Shared project dir | `root:dev-team` with `775` — whole team can collaborate |

---

_Day 11 of #90DaysOfDevOps | #DevOpsKaJosh | #TrainWithShubham_
