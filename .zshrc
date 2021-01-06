export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
ZSH_DISABLE_COMPFIX="true"

plugins=(git ssh-agent docker docker-compose terraform golang zsh-autosuggestions zsh-syntax-highlighting github)

source $ZSH/oh-my-zsh.sh
source ~/google-cloud-sdk/path.zsh.inc
source ~/google-cloud-sdk/completion.zsh.inc

# User configuration

export LESSCHARSET="utf-8"
export LOCALE="en_US.utf8"
export LANG=en_US.utf8
export CC="gcc"
export CXX="g++"
export LC="en_US.utf8"
export LC_CTYPE="en_US.utf8"
export LC_NUMERIC="en_US.utf8"
export LC_TIME="en_US.utf8"
export LC_COLLATE="en_US.utf8"
export LC_MONETARY="en_US.utf8"
export LC_MESSAGES="en_US.utf8"
export LC_PAPER="en_US.utf8"
export LC_NAME="en_US.utf8"
export LC_ADDRESS="en_US.utf8"
export LC_TELEPHONE="en_US.utf8"
export LC_MEASUREMENT="en_US.utf8"
export LC_IDENTIFICATION="en_US.utf8"
export LC_ALL="en_US.utf8"

# Env variables
export PATH=$PATH:$HOME/.mix/escripts
export GO111MODULE=on
export EDITOR=/usr/bin/vim
export TERM=xterm-256color

# Aliases
alias grep='grep --color=auto'
alias :q='exit'

alias bashrc='vim ~/.bashrc'
alias zshconfig='vim ~/.zshrc'
alias ohmyzsh='vim ~/.oh-my-zsh'
alias vimrc="vim ~/.vimrc"

# Change up a variable number of directories
# E.g:
#   cdn   -> cdn ../
#   cdn 2 -> cdn ../../
#   cdn 3 -> cdn ../../../
function cdn() {
    local count=$1
    if [ -z "${count}" ]; then
        count=1
    fi

    local path=""
    for i in {1..${count}}; do
        path="${path}../"
    done

    cd $path
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wesleipereira/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/wesleipereira/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wesleipereira/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/wesleipereira/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
