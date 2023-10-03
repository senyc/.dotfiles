alias clip='xclip -selection c'
alias start_mtu_vpn='echo "Enter MTU password"; f5fpc --start --host https://vpn.mtu.edu --user kdbomhof -x'
alias end_mtu_vpn='f5fpc --stop'
alias info_mtu_vpn='f5fpc --info'
alias sl='ls'
alias sls='ls'
alias updateall='echo "updating machine and apps"; sudo apt update && sudo apt upgrade -yy && sudo apt autoremove -yy && flatpak update -y'
alias v='nvim'
alias nv='nvim'
alias vim='nvim'
alias clera='clear'
alias code='nvim'
alias nivm='nvim'
alias py='python3'
alias nvim.='nvim .'
alias tumx='tmux'
alias t='tmux'
alias cd-='cd -'
alias cd..-='cd ..'
alias clr='clear'
# **Git related aliases ** #
alias g='git'
alias gs='git status'
alias gc='git commit'
alias gca='git commit --amend'
alias gcae='git commit --amend --no-edit'
alias gcm='git commit -m'
alias ga='git add'
alias gap='git add -p'
alias gaa='git add --all'
alias gd='git diff'
alias gp='git push'
alias gds='git diff --staged'
alias aspell='aspell --lang=en_US --personal=$HOME/.aspell_en_dict'
alias compose='docker-compose'
alias start_papercut='sh ~/printing/papercut/pc-client-linux.sh'
alias s='sudo'
