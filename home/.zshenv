export TERM='screen-256color'
export EDITOR='nvim'
export VISUAL='nvim'

export HISTSIZE=1000
export HISTFILESIZE=2000

export ZDOTDIR="$HOME/.zsh/"
export XDG_CONFIG_HOME="$HOME/.config"

export PNPM_HOME="/home/senyc/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH" 

# Stops less from clearing the screen and will cause
# less to exit if the contents can fit on the screen
export LESS="-FXR"
