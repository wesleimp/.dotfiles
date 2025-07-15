# Source helper scripts
# source ~/.sh_helpers

# Set environment variables
set -gx LESSCHARSET "utf-8"
set -gx LOCALE "en_US.UTF-8"
set -gx LANG en_US.UTF-8
set -gx CC "gcc"
set -gx CXX "g++"
set -gx LC "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"
set -gx LC_NUMERIC "en_US.UTF-8"
set -gx LC_TIME "en_US.UTF-8"
set -gx LC_COLLATE "en_US.UTF-8"
set -gx LC_MONETARY "en_US.UTF-8"
set -gx LC_MESSAGES "en_US.UTF-8"
set -gx LC_PAPER "en_US.UTF-8"
set -gx LC_NAME "en_US.UTF-8"
set -gx LC_ADDRESS "en_US.UTF-8"
set -gx LC_TELEPHONE "en_US.UTF-8"
set -gx LC_MEASUREMENT "en_US.UTF-8"
set -gx LC_IDENTIFICATION "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

set -gx HG_PATH $HOME/workspace

# Path configurations
set -gx GOPATH ~/go
fish_add_path $HOME/.mix/escripts
fish_add_path $HOME/.local/bin
fish_add_path $GOPATH/bin
fish_add_path $HOME/.mix
fish_add_path $HOME/.cabal/bin
fish_add_path $HOME/.ghcup/bin
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/Library/Python/3.8/bin
fish_add_path (brew --prefix python)/libexec/bin
fish_add_path $HG_PATH/hydra/cli

# Additional environment variables
set -gx GO111MODULE on
set -gx EDITOR nvim
set -gx SHELL (which fish)
set -gx TERM xterm-256color
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx TERMINAL "ghostty"
set -gx BROWSER "brave-browser"
set -gx DOTFILES $HOME/.dotfiles
set -gx NVIMCONF $HOME/nvim

# Erlang/OTP specific configurations
set -gx KERL_BUILD_DOCS yes
set -gx KERL_CONFIGURE_OPTIONS "--without-javac"
set -gx KERL_INSTALL_MANPAGES yes
set -gx KERL_INSTALL_HTMLDOCS yes

# Source additional configuration files
source "$HOME/.cargo/env.fish"
# source $HOME/.cargo/bin
# source ~/.aliases
source ~/.config/fish/abbr.fish
source ~/.hgrc.fish

# Google Cloud SDK configuration
if test -f '/home/weslei/google-cloud-sdk/path.fish.inc'
    source '/home/weslei/google-cloud-sdk/path.fish.inc'
end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# # OPAM configuration
# if test -f '/Users/weslei/.opam/opam-init/init.fish'
#     source '/Users/weslei/.opam/opam-init/init.fish'
# end

# Starship prompt
starship init fish | source

# Plugins
zoxide init fish | source

# Aliases
alias luamake='/home/weslei/lua-language-server/3rd/luamake/luamake'

# Terminal color fix (similar to ZSH version)
if test "$TERM" = "xterm"
    set -gx TERM xterm-256color
end
