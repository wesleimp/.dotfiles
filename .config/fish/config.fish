set -U fish_greeting

set -gx EDITOR nvim
set -gx TERMINAL wezterm
set -gx BROWSER brave-browser
set -gx TERM xterm-256color

fish_add_path -p \
  $HOME/.mix/escripts \
  $HOME/.local/bin \
  $GOPATH/bin \
  $HOME/.mix \
  /opt/homebrew/bin \
  $HOME/Library/Python/3.8/bin \
  $HOME/.cargo/bin

set -x GOPATH $HOME/go
set -x GO111MODULE on
set -x FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
set -x DOTFILES $HOME/.dotfiles
set -x NVIMCONF $HOME/nvim

# Aliases
source $HOME/.config/fish/abbr.fish

if test -f ~/.config/fish/config.local.fish
    source ~/.config/fish/config.local.fish
end

starship init fish | source
