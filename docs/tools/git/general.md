---
tags:
- tools
- cli
- git
---
#  Git General

![Git Transport](img/git-transport.png){.center}

## Links

- [Bitbucket](https://bitbucket.org/dashboard)
- [Github](https://github.com/tschinz)
- [Gitlab](https://gitlab.com/dashboard)
- [Official Git Webpage](http://git-scm.com/)
- [Tutorial Git Branching](http://pcottle.github.com/learnGitBranching/?nodemo)

## Global setup

``` bash
git config --global user.name "username"
git config --global user.email "your@email.com"
```

### Check setup

``` bash
git config --list
```

### Save Credentials

``` bash
git config credential.helper store
```

### Not verify https Certificates

``` bash
git config --global http.sslVerify false
```

### Set commandline colors

``` bash
git config color.status.added "green bold"
git config color.status.changed "yellow bold"
git config color.status.untracked "red bold"
```

### Set commandline editor

``` bash
git config --global core.editor "nano -w"
```

## Git Repo Creation / Cloning

### Create new repo

``` bash
git init
```

### Status of repo

``` bash
git status
```

### Settings of repo

``` bash
git remote -v
```

### Clone existing repo

``` bash
git clone git@gitlab.hevs.ch:course/ElN/eln_labs.git
cd eln_labs
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master
```

### Revert to last commit state

go back to last committed servers state (can't be undone)

``` bash
git reset --hard
```

### Existing folder

``` bash
cd existing_folder
git init
git remote add origin git@gitlab.hevs.ch:course/ElN/eln_labs.git
git add .
git commit -m "Initial commit"
git push -u origin master
```

### Switch to new Remote

``` bash
cd existing_repo
git remote rename origin old-origin
git remote add origin git@gitlab.hevs.ch:course/ElN/eln_labs.git
git push -u origin --all
git push -u origin --tags
```

### Get Remote Information

``` bash
git remote show origin
```

### Change Push Remote URL

``` bash
git remote set-url --push <new_repo_push_url>
```

## Git Repo information

``` bash
# Status about current files ion folder
git status

# Status about last commits
git log --oneline
```

## Add Files

``` bash
# Stage a File
git add README.md

# Commit file
git commit –m "Initial commit, add README file"
```

## Checkout

``` bash
# Checkout certain commit
git checkout e006db0 -b inspectingPrev

# Checkout given branch
git chekout master
```

## Push

``` bash
git push origin master
```

## Branch

``` bash
# Create new branch
git branch dev_branch_1

# List all existing branches
git branch

# Checkout certain branch
git branch dev_branch_1

# Delete certain branch
git branch -d dev_branch_1
```

### Merge

``` bash
# Checkout branch you want to merge into
git checkout master
# Merge the two branches
git merge dev_branch_1
```