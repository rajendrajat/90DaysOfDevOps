# Day 11 – File Ownership (chown & chgrp)

## Files & Directories Created

| File / Directory | Purpose |
|-----------------|---------|
| `devops-file.txt` | Practice chown (user change) |
| `team-notes.txt` | Practice chgrp (group change) |
| `project-config.yaml` | Practice combined owner:group change |
| `app-logs/` | Practice chown on a directory |
| `heist-project/vault/gold.txt` | Practice recursive chown |
| `heist-project/plans/strategy.conf` | Practice recursive chown |
| `bank-heist/access-codes.txt` | Final challenge – tokyo:vault-team |
| `bank-heist/blueprints.pdf` | Final challenge – berlin:tech-team |
| `bank-heist/escape-plan.txt` | Final challenge – nairobi:vault-team |

---

## Users & Groups Created

```bash
# Users
sudo useradd tokyo
sudo useradd berlin
sudo useradd nairobi
sudo useradd professor

# Groups
sudo groupadd heist-team
sudo groupadd planners
sudo groupadd vault-team
sudo groupadd tech-team
```

---

## Task 1: Understanding Ownership

```bash
ls -l
```

**Output:**
```
-rw-r--r-- 1 rajen rajen  46 Mar  8 notes.txt
-rwxr-xr-x 1 rajen rajen  20 Mar  8 script.sh
```

**Format breakdown:**
```
-rw-r--r--  1  rajen  rajen  46  Mar 8  notes.txt
│           │  │      │
│           │  │      └── Group  → who the file belongs to (team access)
│           │  └───────── Owner  → the user who created/owns the file
│           └──────────── Hard link count
└──────────────────────── Permissions
```

| Concept | Meaning |
|---------|---------|
| **Owner** | The individual user responsible for the file. Has the most control. |
| **Group** | A collection of users. Useful for shared team access without giving full ownership. |

> In DevOps: a web server file might be owned by `www-data` (owner) and belong to `developers` (group) — so devs can read logs but only the service can write them.

---

## Task 2: chown Operations

```bash
touch devops-file.txt
sudo chown tokyo devops-file.txt
sudo chown berlin devops-file.txt
```

| Step | Command | Result |
|------|---------|--------|
| Initial | — | `-rw-r--r-- 1 root root` |
| Change to tokyo | `sudo chown tokyo devops-file.txt` | `-rw-r--r-- 1 tokyo root` |
| Change to berlin | `sudo chown berlin devops-file.txt` | `-rw-r--r-- 1 berlin root` |

> Note: Group stayed as `root` — `chown username` only changes the owner, not the group.

---

## Task 3: chgrp Operations

```bash
touch team-notes.txt
sudo groupadd heist-team
sudo chgrp heist-team team-notes.txt
```

| Step | Before | After |
|------|--------|-------|
| `team-notes.txt` | `root root` | `root heist-team` |

> Note: Owner stayed `root` — `chgrp` only changes the group.

---

## Task 4: Combined Owner & Group Change

```bash
touch project-config.yaml
sudo chown professor:heist-team project-config.yaml

mkdir app-logs/
sudo chown berlin:heist-team app-logs/
```

| File | Before | After |
|------|--------|-------|
| `project-config.yaml` | `root:root` | `professor:heist-team` |
| `app-logs/` | `root:root` | `berlin:heist-team` |

**Syntax:** `sudo chown owner:group filename` — changes both in a single command ✅

---

## Task 5: Recursive Ownership

```bash
mkdir -p heist-project/vault heist-project/plans
touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf

sudo groupadd planners
sudo chown -R professor:planners heist-project/
```

**Before (`ls -lR heist-project/`):**
```
heist-project/:
drwxr-xr-x 2 root root 4096  plans/
drwxr-xr-x 2 root root 4096  vault/

heist-project/plans:
-rw-r--r-- 1 root root 0  strategy.conf

heist-project/vault:
-rw-r--r-- 1 root root 0  gold.txt
```

**After (`sudo chown -R professor:planners heist-project/`):**
```
heist-project/:
drwxr-xr-x 2 professor planners 4096  plans/
drwxr-xr-x 2 professor planners 4096  vault/

heist-project/plans:
-rw-r--r-- 1 professor planners 0  strategy.conf

heist-project/vault:
-rw-r--r-- 1 professor planners 0  gold.txt
```

> `-R` flag applied ownership change to the parent directory **and** all files/subdirectories inside it recursively.

---

## Task 6: Practice Challenge – bank-heist/

```bash
mkdir -p bank-heist
touch bank-heist/access-codes.txt bank-heist/blueprints.pdf bank-heist/escape-plan.txt

sudo chown tokyo:vault-team   bank-heist/access-codes.txt
sudo chown berlin:tech-team   bank-heist/blueprints.pdf
sudo chown nairobi:vault-team bank-heist/escape-plan.txt
```

**Final `ls -l bank-heist/`:**
```
-rw-r--r-- 1 tokyo   vault-team  0  access-codes.txt
-rw-r--r-- 1 berlin  tech-team   0  blueprints.pdf
-rw-r--r-- 1 nairobi vault-team  0  escape-plan.txt
```

Each file has a different owner and group — exactly as required ✅

---

## Commands Reference Used Today

```bash
# View ownership
ls -l filename
ls -lR directory/        # recursive view

# Change owner only
sudo chown newowner filename

# Change group only
sudo chgrp newgroup filename

# Change both owner and group (one command)
sudo chown owner:group filename

# Change group only via chown
sudo chown :groupname filename

# Recursive change
sudo chown -R owner:group directory/

# Create user
sudo useradd username

# Create group
sudo groupadd groupname
```

---

## What I Learned

1. **Owner vs Group are separate concepts** — `chown` changes the owner, `chgrp` changes the group. You can change both at once with `chown owner:group`. This separation allows fine-grained access control: one user owns a file, but a whole team (group) can be given read access.

2. **`-R` flag is powerful — and dangerous** — Recursive `chown -R` changes ownership of everything inside a directory in one shot. In production, running this on the wrong path (like `/etc` or `/var`) can break system services instantly. Always double-check the path before using `-R`.

3. **Users and groups must exist before you use them** — `chown tokyo file.txt` will fail with `invalid user` if `tokyo` hasn't been created yet. In real DevOps workflows, user/group provisioning (via Ansible, Terraform, or cloud IAM) always comes before file ownership is assigned.

---

*Day 11 of #90DaysOfDevOps | #DevOpsKaJosh | #TrainWithShubham*
