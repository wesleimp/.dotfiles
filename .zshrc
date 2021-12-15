# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX="true"
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_TRUNC=0
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false

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
export GO111MODULE=on
export EDITOR=nvim
export TERM=xterm-256color
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export TERMINAL="alacritty"
export BROWSER="firefox"
export DOTFILES=$HOME/.dotfiles

source $HOME/.cargo/env
source ~/.aliases

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi
