#!/usr/bin/env bash

dir=~/.dotfiles

doties=(
    # files
    .alacritty.yml
    .aliases
    .bashrc
    .curlrc
    .gitconfig
    .globalgitignore
    .inputrc
    .tmux-cht-command
    .tmux-cht-languages
    .tmux.conf
    .zshrc

    # dirs
    .config/picom
    .config/i3
    .config/kitty
    .config/rofi
    .config/polybar

    .tmux/themes
)

bins=(
    bin/tmux-cht.sh
    bin/tmux-sessionizer
    bin/tmux-windowizer
)

echo "Creating symlinks from $dir to ~/"
echo

# config files
echo "Symlinking config files:"
for dot in $doties; do
    echo "==> symlinking $dot"
    ln -s $dir/$dot ~/$dot
done
echo

# bin files
echo "Symlinking bin files"
for bin in $bins; do
    echo "==> symlinking $bin"
    ln -s $dir/$bin ~/.local/$bin
done

echo
echo "Symlink done"
