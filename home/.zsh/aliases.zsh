# ************************
# * Add colors to output *
# ************************

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'

# **************************
# * Common typing mistakes *
# **************************

alias v='nvim'
alias nv='nvim'
alias vim='nvim'
alias code='nvim'
alias py='python3'
alias clr='clear'
alias tumx='tmux'

# ************************
# * Positional shorthand *
# ************************

alias nvim.='nvim .'
alias nvim..='nvim ..'
alias cd-='cd -'
alias cd..-='cd ..'

# ********************
# * Common shortcuts *
# ********************

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ta='tmux a'
alias t='tmux'
alias s='sudo'
alias ts='tmux-sessionizer'
alias compose='docker-compose'

alias g='git'
alias gd='git diff'
alias gds='git diff --staged'
alias gs='git status'
alias gsw='git switch'
alias gsw-='git switch -'
alias gc='git commit'
alias ga='git add'
alias gca='git commit --amend'
alias gcae='git commit --amend --no-edit'
alias gcm='git commit -m'
alias gap='git add -p'
alias gaa='git add --all'
alias gcpm='git cherry-pick -e -x -m 1'

alias aspell='aspell --lang=en_US --personal=$HOME/.aspell_en_dict'

alias k='kubectl'
alias kgp='kubectl get pods'

# ******************
# * Global aliases *
# ******************

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# ********************
# * Function aliases *
# ********************

alias ff='file_find'
