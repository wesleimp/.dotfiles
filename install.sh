#!/usr/bin/env bash

dir=~/.dotfiles
olddir=~/.dotfiles/old

doties=".vim .bashrc .gitconfig .globalgitignore .tmux.conf .vimrc .zshrc"

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
	mv $dir
	
	for dot in $doties; do
		echo "Symlink $dot"
		ln -s $dir/$dot ~/$dot
	done

	echo "Symlink completed!"
}

start
