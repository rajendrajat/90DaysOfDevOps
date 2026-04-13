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
<img width="817" height="277" alt="image" src="https://github.com/user-attachments/assets/d3f2ecb1-cfda-4923-a80c-5e558bfe7cf6" />
<img width="802" height="231" alt="image" src="https://github.com/user-attachments/assets/19ca0899-3457-4724-a9cf-2725dac7f152" />
<img width="1553" height="338" alt="image" src="https://github.com/user-attachments/assets/f2c67982-8a56-48c3-9a01-531151580aa5" />
<img width="839" height="332" alt="image" src="https://github.com/user-attachments/assets/ad559c7d-7199-4664-a7e2-8a74e5029fb8" />




---

### Task 2: Create Physical Volume

```bash
pvcreate /dev/sdb
pvs
```

**Screenshot:** `[Add screenshot of pvcreate and pvs output]`
<img width="615" height="95" alt="image" src="https://github.com/user-attachments/assets/81db3b29-b454-4c89-9192-7d38da5c0833" />
<img width="539" height="228" alt="image" src="https://github.com/user-attachments/assets/7a8d075a-144e-4d87-ab9c-1103b4282a0b" />


---

### Task 3: Create Volume Group

```bash
vgcreate devops-vg /dev/sdb
vgs
```

**Screenshot:** `[Add screenshot of vgcreate and vgs output]`
<img width="539" height="228" alt="image" src="https://github.com/user-attachments/assets/3a2f20fa-3c29-48cc-bc19-d6efe199eaac" />
<img width="506" height="94" alt="image" src="https://github.com/user-attachments/assets/6812c022-223d-4143-8db6-e3969e9ef1e6" />


---

### Task 4: Create Logical Volume

```bash
lvcreate -L 500M -n app-data devops-vg
lvs
```

**Screenshot:** `[Add screenshot of lvcreate and lvs output]`
<img width="662" height="928" alt="image" src="https://github.com/user-attachments/assets/86baaa2f-3a1e-4cbf-9272-438ccca43654" />
<img width="709" height="418" alt="image" src="https://github.com/user-attachments/assets/661beada-3b46-4bc2-be0d-44d269892d4c" />

---

### Task 5: Format and Mount

```bash
mkfs.ext4 /dev/devops-vg/app-data
mkdir -p /mnt/app-data
mount /dev/devops-vg/app-data /mnt/app-data
df -h /mnt/app-data
```

**Screenshot:** `[Add screenshot of mkfs.ext4, mount, and df -h output]`
<img width="706" height="596" alt="image" src="https://github.com/user-attachments/assets/543cc8f0-f7ca-4454-9ccb-0e84e1e1184c" />
<img width="1627" height="905" alt="image" src="https://github.com/user-attachments/assets/f2269e84-f516-478c-bc9f-4844b7a497f5" />
<img width="961" height="515" alt="image" src="https://github.com/user-attachments/assets/39be6de4-5c64-499a-84a8-57b10625d457" />

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
