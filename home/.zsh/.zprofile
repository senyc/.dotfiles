export TERM='screen-256color'
export EDITOR='nvim'
export VISUAL='nvim'

export TZ='America/Detroit'

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PATH:$RACKET_HOME:$PNPM_HOME"

export HISTSIZE=1000
export HISTFILESIZE=2000
export GOPRIVATE=github.com/senyc/jason

# Stops less from clearing the screen and will cause
# less to exit if the contents can fit on the screen
export LESS="-FXR"

# If home binary path exists, add it to path
[[ -d ~/bin ]] && export PATH="$HOME/bin:$PATH"

# Starting the xorg server
[[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && startx
