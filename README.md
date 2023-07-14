
# senyc's dotfiles

## Installation 

### GitHub

```bash
git clone https://github.com/senyc/.dotfiles
cd .dotfiles
```

## Photos

![2023-07-13-24-1689294261_screenshot](https://github.com/senyc/.dotfiles/assets/95313103/bf924eb3-4900-4933-b490-7019e9a11fae)

## Usage 

This repository contains two primary sections:
  1. `home` which contains all files/directories that live in the user's home path (`$HOME`)
  2. `config` which contains all files/directories that live in the user's standard configuration path often known as `$XDG_CONFIG_HOME`

To dynamically link files in the source repository to the local system the shell script `setup` can be used. Upon the user's confirmation, it will create new symbolic links for files that don't exist on the system. For files that already exist, the user is prompted on if they would like to remove them for linking. All prompts can be skipped with the appropriate option.

```
Usage: ./setup OPTION...
Utility for linking system configuration files to files contained in this repository.
Also gives the opportunity to remove files that are not linked.

options
  -h --help          Displays this help and exits
  -c --config        Only searches files in ~/.config
  -o --home          Only searches files in the user's home directory
  -l --link          Automatically confirms the linking of files
  -r -d --remove     Automatically confirms the deletion of files
  -f --force         Automatically confirms linking and the deletion of files
```
