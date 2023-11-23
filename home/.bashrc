# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

export PATH=$PATH:/home/senyc/.local/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/home/senyc/.local/share/gem/ruby/3.0.0/bin
export TERM='screen-256color'
export EDITOR='nvim'
export VISUAL='nvim'

# Create home configuration environment variable
export XDG_CONFIG_HOME="$HOME/.config"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH=$PATH:"$HOME/bin"
fi

# Node version manager
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -d "$HOME/node_modules" ] ; then
    PATH=$PATH:"$HOME/node_modules"
fi

# Enable git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# *************************
# * Function Declarations *
# *************************

# Allows for a quick way to change directories and read new child items
c() {
    if [ -z "$1" ]; then
        cd "$HOME" || return
        ls --color=auto
        return
    fi
    cd "$1" || return
    ls --color=auto
}

# Allows for a quick way to navigate to base project directory
cdb() {
    if [ -n "$1" ]; then
        case $1 in 
            "--help")
                echo "searches for git base level directory and moves working directory there"
                return
                ;;
            -*)
                echo "searches for git base level directory and moves working directory there"
                return
                ;;
        esac
        return
    fi

    base_git_dir=$(git rev-parse --show-toplevel)
    if [ -n "$base_git_dir" ]; then
        cd "$base_git_dir" || return
    else 
        echo "Can't find base git directory, are you in a git repo?"
    fi
}

export PNPM_HOME="/home/senyc/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

__conda_setup="$('/home/senyc/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/senyc/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/senyc/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/senyc/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

eval "$(starship init bash)"
