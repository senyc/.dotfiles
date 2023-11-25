unsetopt menu_complete # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
setopt no_complete_aliases

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion::complete:*' gain-privileges 1 # Sudo autocomplete
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit
compinit
