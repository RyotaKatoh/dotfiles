#!/bin/sh

# !!!attention!!!
# this script remove following files!
if test -f ~/.vimrc
then
	rm ~/.vimrc
fi

if test -f ~/.zshrc
then
	rm ~/.zshrc
fi

ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/zshrc ~/.zshrc
