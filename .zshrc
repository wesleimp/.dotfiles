export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX="true"

plugins=(
    git
    ssh-agent
    zsh-autosuggestions
    zsh-syntax-highlighting
    asdf
)

source $ZSH/oh-my-zsh.sh

export LESSCHARSET="utf-8"
export LOCALE="en_US.UTF-8"
export LANG=en_US.UTF-8
export CC="gcc"
export CXX="g++"
export LC="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Env variables
export GOPATH=~/go
export PATH=$PATH:$HOME/.mix/escripts
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.mix
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:$HOME/.ghcup/bin
export GO111MODULE=on
export EDITOR=nvim
export TERM=xterm-256color
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export TERMINAL="kitty"
export BROWSER="brave-browser"
export DOTFILES=$HOME/.dotfiles
export NVIMCONF=$HOME/nvim

source $HOME/.cargo/env
source ~/.aliases

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

alias luamake=/home/weslei/lua-language-server/3rd/luamake/luamake

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/weslei/google-cloud-sdk/path.zsh.inc' ]; then . '/home/weslei/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/weslei/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/weslei/google-cloud-sdk/completion.zsh.inc'; fi
