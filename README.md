# dotfiles

my personal configurations for unix-y systems, mostly macOS and Linux.

## setup

in your home directory, init a git repo:
```
git init
```

set the remote to this repo:
```
git remote add sh git@git.sr.ht:~reno/dotfiles
```

pull files:
```
git fetch --all && git pull sh main
```

to add changes, run the following:
```
git add -f <file>
git commit
```
