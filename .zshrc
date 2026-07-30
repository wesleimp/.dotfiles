source ~/.sh_helpers
export ZSH=$HOME/.oh-my-zsh
# export SHELL=$(which fish)

ZSH_THEME="muse"

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
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:$HOME/Library/Python/3.8/bin
export PATH="$(brew --prefix python)/libexec/bin:$PATH"
export GO111MODULE=on
export EDITOR=nvim
export TERM=xterm-ghostty
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export TERMINAL="ghostty"
export BROWSER="brave-browser"
export DOTFILES=$HOME/.dotfiles
export NVIMCONF=$HOME/nvim

export KERL_BUILD_DOCS=yes
export KERL_CONFIGURE_OPTIONS="--without-javac"
export KERL_INSTALL_MANPAGES=yes
export KERL_INSTALL_HTMLDOCS=yes

source $HOME/.cargo/env
source $HOME/.cargo/bin
source ~/.aliases

source ~/.hginsightsrc

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $TERM == xterm ]]; then TERM=xterm-ghostty; fi

alias luamake=/home/weslei/lua-language-server/3rd/luamake/luamake

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/weslei/google-cloud-sdk/path.zsh.inc' ]; then . '/home/weslei/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/weslei/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/weslei/google-cloud-sdk/completion.zsh.inc'; fi

 eval "$(starship init zsh)"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/weslei/.opam/opam-init/init.zsh' ]] || source '/Users/weslei/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

eval "$(mise activate zsh)"
eval "$(mise activate --shims)"
