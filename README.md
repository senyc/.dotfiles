# senyc's dotfiles

## Installation 

### GitHub

```bash
git clone https://github.com/senyc/.dotfiles
cd .dotfiles
```

## Photos
![2024-02-22-08-1708610882_screenshot](https://github.com/senyc/.dotfiles/assets/95313103/383ae458-53e0-4a1c-8a02-7eb810f55fea)

![2024-02-22-02-1708610579_screenshot](https://github.com/senyc/.dotfiles/assets/95313103/f15ad182-7e1e-4415-bde7-4a2818f5ce35)
![2024-02-22-05-1708610716_screenshot](https://github.com/senyc/.dotfiles/assets/95313103/9b186ac4-6101-49bd-8a3d-b09f12000900)
![2024-02-22-04-1708610646_screenshot](https://github.com/senyc/.dotfiles/assets/95313103/17fe6d7e-1a92-4c81-9c91-8cdf437ab6c9)
![2024-02-22-03-1708610612_screenshot](https://github.com/senyc/.dotfiles/assets/95313103/7ec54c43-0823-45c1-bec2-6cbc5b19fc4b)





## Usage 

### Linking configuration files

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

### Package installation

In order to install all related packages and applications there is a script that will first validate if something is already installed, and will install it if it does not already exist on the machine.

#### Installation script requirements

- The Installation script relies on the `which` package to validate if something already exists.
- The script expects that `pacman` is the system package manager, if it is not the script will fail.
- The script assumes that git is installed and set up.

#### Steps

1. Run `./install`
  - all packages in `packagelist` file will be installed
  - neovim will be built from source (repo downloaded to `~/tmp/neovim`)
  - `tmux` will be installed as well as `tpm`
  - `conda` will be installed and a base environment will be set up
  - `zsh` will be configured as the default shell
2. In order for all environment variables to be set up correctly in the shell, you will need to login again.
