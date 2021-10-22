#!/usr/bin/env bash

dir=~/.dotfiles
olddir=~/.dotfiles/old

doties=".bashrc .curlrc .gitconfig .globalgitignore .inputrc .tmux.conf .zshrc Brewfile .config/nvim"

start() {
	doBackup
	doSymlink
}

doBackup() {
	echo "Backuping files to $olddir"
	mkdir -p $olddir

	for dot in $doties; do
		echo "Moving $dot"
		mv ~/$dot $olddir
	done

	echo "Backup completed!"
}

doSymlink() {
	echo "Creating symlinks from $dir to ~/"

	for dot in $doties; do
		echo "Symlinking $dot"
		ln -s $dir/$dot ~/$dot
	done

	echo "Symlink completed!"
}

start
