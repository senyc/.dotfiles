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

# Set environment variable "$1" to default value "$2" if "$1" is not yet defined.
#
# Arguments:
#    1. name - The env variable to set
#    2. val  - The default value
# Return value:
#    0 if the env variable exists, 3 if it was set
#
env_default() {
    [[ ${parameters[$1]} = *-export* ]] && return 0
    export "$1=$2" && return 3
}
# alias alias=alias_with_path
# }}}
# {{{2 Extract Stuff
extract() {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
