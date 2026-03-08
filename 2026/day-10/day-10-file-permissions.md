# Day 10 – File Permissions & File Operations

## Files Created

| File | Created With | Purpose |
|------|-------------|---------|
| `devops.txt` | `touch devops.txt` | Empty placeholder file |
| `notes.txt` | `echo "..." > notes.txt` | File with content |
| `script.sh` | `echo '...' > script.sh` | Shell script |
| `project/` | `mkdir project` | Directory |

---

## Commands Used

### Task 1: Create Files
```bash
touch devops.txt
echo "These are my DevOps learning notes. Linux is powerful!" > notes.txt
echo 'echo "Hello DevOps"' > script.sh
ls -l devops.txt notes.txt script.sh
```

### Task 2: Read Files
```bash
cat notes.txt
head -5 /etc/passwd
tail -5 /etc/passwd
```

**Output of `cat notes.txt`:**
```
These are my DevOps learning notes. Linux is powerful!
```

**Output of `head -5 /etc/passwd`:**
```
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
```

**Output of `tail -5 /etc/passwd`:**
```
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
systemd-network:x:998:998:systemd Network Management:/:/usr/sbin/nologin
messagebus:x:100:101::/nonexistent:/usr/sbin/nologin
polkitd:x:997:997:User for polkitd:/:/usr/sbin/nologin
```

---

## Permission Changes

### Understanding the Format
```
-rwxr-xr-x
│└──┘└──┘└──┘
│  │   │   └── Others  (r-x = 5)
│  │   └─────── Group   (r-x = 5)
│  └─────────── Owner   (rwx = 7)
└────────────── File type (- = file, d = directory)
```

### Task 3: Initial Permissions (after `ls -l`)
```
<<<<<<< HEAD
-rw-rw-r-- 1 rajen rajen  0  devops.txt   → 664
-rw-rw-r-- 1 rajen rajen 46  notes.txt    → 664
-rw-rw-r-- 1 rajen rajen 20  script.sh    → 664
-rwxr-xr-x 1 rajen rajen 81  sysinfo.sh   → 755
drwxrwxr-x 3 rajen rajen 4096 tws10       → 775
```
- **Owner (rajen):** can read + write on all files
- **Group (rajen):** can read + write (note: `664` not `644` — your system's default `umask` is `002`)
- **Others:** can read only
- `sysinfo.sh` already has execute permission (pre-existing file)
- No new file has execute permission yet

> 💡 **Why `664` and not `644`?** Your system uses `umask 002` instead of the common `umask 022`. This means group write permission is granted by default. You can check with: `umask`
=======
-rw-r--r-- 1 root root  0  devops.txt   → 644
-rw-r--r-- 1 root root 55  notes.txt    → 644
-rw-r--r-- 1 root root 20  script.sh    → 644
```
- **Owner (root):** can read + write
- **Group:** can read only
- **Others:** can read only
- No file has execute permission yet
>>>>>>> cd278c2 (added day 10 updated file)

---

### Task 4: Permission Changes

#### `script.sh` — Make Executable
```bash
chmod +x script.sh
```
| | Before | After |
|--|--------|-------|
| Permissions | `-rw-r--r--` (644) | `-rwxr-xr-x` (755) |
| Owner | rw- | rwx |
| Group | r-- | r-x |
| Others | r-- | r-x |

**Ran the script:**
```bash
./script.sh
# Output: Hello DevOps ✅
```

---

#### `devops.txt` — Make Read-Only
```bash
chmod -w devops.txt
```
| | Before | After |
|--|--------|-------|
| Permissions | `-rw-r--r--` (644) | `-r--r--r--` (444) |
| Owner | rw- | r-- |
| Group | r-- | r-- |
| Others | r-- | r-- |

---

#### `notes.txt` — Set to 640
```bash
chmod 640 notes.txt
```
| | Before | After |
|--|--------|-------|
| Permissions | `-rw-r--r--` (644) | `-rw-r-----` (640) |
| Owner | rw- | rw- |
| Group | r-- | r-- |
| Others | r-- | --- |

> Others now have **zero access** to notes.txt

---

#### `project/` — Directory with 755
```bash
mkdir project
chmod 755 project
```
```
drwxr-xr-x  project
```
| Who | Can do |
|-----|--------|
| Owner | Enter, list, create/delete files |
| Group | Enter and list only |
| Others | Enter and list only |

---

## Task 5: Testing Permission Restrictions

### Test 1 – Write to Read-Only File
```bash
echo "test" >> devops.txt
```
**Error:**
```
bash: devops.txt: Permission denied
```
> ✅ Linux blocked the write because `devops.txt` has no write bits (`r--r--r--`)

---

### Test 2 – Execute Without Execute Permission
```bash
./notes.txt
```
**Error:**
```
bash: ./notes.txt: Permission denied
```
> ✅ Linux blocked execution because `notes.txt` has no `x` bit

---

## Permission Reference Cheat Sheet

| Numeric | Symbolic | Meaning |
|---------|----------|---------|
| 7 | rwx | Read + Write + Execute |
| 6 | rw- | Read + Write |
| 5 | r-x | Read + Execute |
| 4 | r-- | Read only |
| 0 | --- | No permissions |

**Common permission sets:**
```bash
chmod 755 script.sh    # Owner: all | Group & Others: read+execute
chmod 644 file.txt     # Owner: read+write | Group & Others: read
chmod 640 secrets.txt  # Owner: read+write | Group: read | Others: nothing
chmod 444 readonly.txt # Everyone: read only
chmod +x script.sh     # Add execute for everyone
chmod -w file.txt      # Remove write for everyone
```

---

## What I Learned

1. **Permissions are a 3-layer system** — owner, group, and others each have independent read/write/execute controls, giving fine-grained security over every file.

2. **Numbers are just shortcuts** — `chmod 755` is the same as `chmod u=rwx,g=rx,o=rx`. The numeric (octal) method is faster once you internalize that r=4, w=2, x=1.

3. **Execute permission is mandatory for scripts** — A shell script does nothing without the `x` bit. This is a common beginner gotcha: `touch script.sh` + writing content isn't enough — you must `chmod +x` before `./script.sh` works.

---

*Day 10 of #90DaysOfDevOps | #DevOpsKaJosh | #TrainWithShubham*
