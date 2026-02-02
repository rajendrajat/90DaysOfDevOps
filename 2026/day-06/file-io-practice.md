# Day 06 – Linux Fundamentals: Read and Write Text Files

This document captures basic Linux file read/write practice using fundamental commands.

Environment:
- OS: Ubuntu Linux
- Access: Terminal / SSH
- File created: notes.txt

---

# 🔹 File Creation

## 1. touch notes.txt

Explanation:  
Creates an empty text file.

Observations:
- File created successfully
- File visible using ls

📸 Output:

<img width="1030" height="66" alt="image" src="https://github.com/user-attachments/assets/9a038c9d-3f6b-4024-9f76-807a4c08bbef" />


---

# 🔹 Writing to a File

## 2. echo "Line 1" > notes.txt

Explanation:  
Writes text to file and overwrites existing content.

Observations:
- First line added
- File now contains initial text

📸 Output:

<img width="730" height="69" alt="image" src="https://github.com/user-attachments/assets/d261c0f9-70de-409a-b2fd-d09c8cb3e9e2" />


---

## 3. echo "Line 2" >> notes.txt

Explanation:  
Appends text without deleting existing content.

Observations:
- Second line added
- Previous content preserved

📸 Output:

<img width="688" height="91" alt="image" src="https://github.com/user-attachments/assets/80c8736a-9b1d-4534-8e5a-9a18e38307aa" />


---

## 4. echo "Line 3" | tee -a notes.txt

Explanation:  
Writes to file and displays output at the same time.

Observations:
- Third line added
- Output shown in terminal

📸 Output:

<img width="745" height="45" alt="image" src="https://github.com/user-attachments/assets/c8e46269-7898-4c42-b5e2-a93caa610833" />


---

# 🔹 Reading Files

## 5. cat notes.txt

Explanation:  
Displays entire file content.

Observations:
- All lines visible
- Confirms file content

📸 Output:

<img width="511" height="95" alt="image" src="https://github.com/user-attachments/assets/151ef708-ae78-4d0c-8704-ef2a0192b881" />


---

## 6. head -n 2 notes.txt

Explanation:  
Shows first two lines of file.

Observations:
- Displays beginning of file
- Useful for large files

📸 Output:

<img width="599" height="69" alt="image" src="https://github.com/user-attachments/assets/66574ca4-0046-4b12-8ba4-efc3a0a045b2" />


---

## 7. tail -n 2 notes.txt

Explanation:  
Shows last two lines of file.

Observations:
- Displays latest entries
- Helpful for log files

📸 Output:

<img width="594" height="71" alt="image" src="https://github.com/user-attachments/assets/52454c47-7098-49e0-9426-b25efcdfde1c" />


---

# ✅ Quick Learnings

- `>` overwrites file content  
- `>>` appends to file  
- `cat`, `head`, and `tail` help read files  
- `tee` writes and displays output  
- File operations are basic but essential skills

---

# ✅ Why This Matters

Reading and writing files is a daily DevOps task.

Logs, configs, and scripts are all text files.  
Comfort with file handling improves troubleshooting and automation speed.
