export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git ssh-agent docker docker-compose terraform golang zsh-autosuggestions zsh-syntax-highlighting github dotnet)

source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env

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
export GOPATH=~/go
export PATH=$PATH:~/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet

# Aliases
alias zshconfig='vim ~/.zshrc'
alias ohmyzsh='vim ~/.oh-my-zsh'
alias vimrc="vim ~/.vimrc"
alias lg="lazygit"
