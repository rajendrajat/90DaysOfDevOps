# Day 13 - Linux Volume Management (LVM)

## Commands Used

### Task 1: Check Current Storage

```bash
lsblk
pvs
vgs
lvs
df -h
```

**Screenshot:** `[Add screenshot of lsblk, pvs, vgs, lvs, df -h output]`

---

### Task 2: Create Physical Volume

```bash
pvcreate /dev/sdb
pvs
```

**Screenshot:** `[Add screenshot of pvcreate and pvs output]`

---

### Task 3: Create Volume Group

```bash
vgcreate devops-vg /dev/sdb
vgs
```

**Screenshot:** `[Add screenshot of vgcreate and vgs output]`

---

### Task 4: Create Logical Volume

```bash
lvcreate -L 500M -n app-data devops-vg
lvs
```

**Screenshot:** `[Add screenshot of lvcreate and lvs output]`

---

### Task 5: Format and Mount

```bash
mkfs.ext4 /dev/devops-vg/app-data
mkdir -p /mnt/app-data
mount /dev/devops-vg/app-data /mnt/app-data
df -h /mnt/app-data
```

**Screenshot:** `[Add screenshot of mkfs.ext4, mount, and df -h output]`

---

### Task 6: Extend the Volume

```bash
lvextend -L +200M /dev/devops-vg/app-data
resize2fs /dev/devops-vg/app-data
df -h /mnt/app-data
```

**Screenshot:** `[Add screenshot of lvextend, resize2fs, and df -h output]`

---

## What I Learned

1. **LVM Architecture:** LVM works in three layers - Physical Volumes (PVs) are the base storage devices, Volume Groups (VGs) pool multiple PVs together, and Logical Volumes (LVs) are the virtual partitions created from the VG pool that can be formatted and mounted like regular partitions.

2. **Flexibility:** Unlike traditional partitioning, LVM allows resizing volumes dynamically without data loss. You can extend a logical volume while it's mounted and in use using `lvextend` followed by `resize2fs`.

3. **Management Commands:** Key LVM commands include `pvcreate`/`pvs` for physical volumes, `vgcreate`/`vgs` for volume groups, and `lvcreate`/`lvs` for logical volumes. The `lsblk` command shows the block devices in a tree format, making it easy to visualize the LVM structure.