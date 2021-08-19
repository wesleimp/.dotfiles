# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX="true"

DRACULA_DISPLAY_CONTEXT=1

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
SPACESHIP_DIR_TRUNC=0
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

plugins=(git ssh-agent docker docker-compose golang zsh-autosuggestions zsh-syntax-highlighting github kubectl elixir)

source $ZSH/oh-my-zsh.sh

source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

source $HOME/.cargo/env

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
export PATH=$PATH:$HOME/.mix/escripts
export GO111MODULE=on
export EDITOR=nvim
export TERM=xterm-256color
export GOPATH=~/go

# Aliases
alias grep='rg'
alias :q='exit'
alias bashrc='vim ~/.bashrc'
alias zshconfig='nvim ~/.zshrc'
alias ohmyzsh='nvim ~/.oh-my-zsh'
alias vimrc="nvim ~/.vimrc"
alias v="nvim ."
alias p10kconfig="vim ~/.p10k.zsh"
alias cat="bat"
alias ls="exa"
alias tree="exa -T"
alias todos="rg --column --line-number --ignore-case --color=always -e '(TODO|FIXME)'"
alias oss="~/oss"
alias workspace="~/workspace"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
