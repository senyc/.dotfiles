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
export PATH="$HOME/.rbenv/versions/3.2.2/bin:$PATH"
eval "$($HOME/tmp/rbenv/src/bin/rbenv init - zsh)"

# nvm
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion

export PATH="$HOME/google-cloud-sdk/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/google-cloud-sdk/completion.zsh.inc:$PATH"
export PATH="$HOME/go/bin:$PATH"
