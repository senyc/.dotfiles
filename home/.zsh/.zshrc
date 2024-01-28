# Runs functions first so that aliases can include them
[[ -f "$ZDOTDIR/functions.zsh" ]] && . "$ZDOTDIR/functions.zsh"
[[ -f "$ZDOTDIR/aliases.zsh" ]] && . "$ZDOTDIR/aliases.zsh"
[[ -f "$ZDOTDIR/options.zsh" ]] && . "$ZDOTDIR/options.zsh"
[[ -f "$ZDOTDIR/completions.zsh" ]] && . "$ZDOTDIR/completions.zsh"
[[ -f "$ZDOTDIR/keymaps.zsh" ]] && . "$ZDOTDIR/keymaps.zsh"

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

eval "$(starship init zsh)"

# bun completions
[ -s "/home/senyc/.bun/_bun" ] && source "/home/senyc/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
