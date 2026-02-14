# Git Fork Workflow -- Complete CLI Cheatsheet

Author: Rajendra Jat\
Purpose: Real-world DevOps fork-based workflow using only CLI

------------------------------------------------------------------------

## 1️⃣ Basic Concepts

-   **origin** → Your forked GitHub repository
-   **upstream** → Original repository you forked from
-   **master/main** → Stable branch synced with upstream
-   **dev** → Your working branch
-   **feature/** → Optional task-specific branches

------------------------------------------------------------------------

## 2️⃣ Initial Setup (One-Time Only)

### Clone Your Fork

    git clone https://github.com/<your-username>/90DaysOfDevOps.git
    cd 90DaysOfDevOps

### Add Upstream Remote

    git remote add upstream https://github.com/TrainWithShubham/90DaysOfDevOps.git

### Verify Remotes

    git remote -v

Expected: - origin → your repo - upstream → original repo

------------------------------------------------------------------------

## 3️⃣ Sync Fork When Upstream Updates

### Step 1 -- Fetch Updates

    git fetch upstream

### Step 2 -- Update Local Master

    git checkout master
    git merge upstream/master

### Step 3 -- Update Your GitHub Fork

    git push origin master

### Step 4 -- Update Dev Branch

    git checkout dev
    git merge master
    git push origin dev

------------------------------------------------------------------------

## 4️⃣ Daily Task Workflow

### Start Work

    git checkout dev
    git pull origin dev

### After Completing Task

    git add .
    git commit -m "Day X task completed"
    git push origin dev

------------------------------------------------------------------------

## 5️⃣ Optional -- Feature Branch Workflow (Professional Style)

### Create Feature Branch

    git checkout dev
    git checkout -b feature/day-X

### Push Feature Branch

    git push origin feature/day-X

------------------------------------------------------------------------

## 6️⃣ Useful Debug Commands

### See All Branches

    git branch -a

### See Commit Graph

    git log --oneline --graph --all

### Check Remote URLs

    git remote -v

------------------------------------------------------------------------

## 7️⃣ Important Rules

-   Never push to upstream
-   Only fetch/merge from upstream
-   Keep master clean
-   Do daily work in dev
-   Sync before starting new task

------------------------------------------------------------------------

## 8️⃣ Minimal Commands To Memorize

### Sync From Upstream

    git fetch upstream
    git checkout master
    git merge upstream/master
    git push origin master
    git checkout dev
    git merge master
    git push origin dev

### Daily Work

    git checkout dev
    git add .
    git commit -m "Task completed"
    git push origin dev

------------------------------------------------------------------------

This workflow mirrors real DevOps fork-based collaboration in production
environments.
