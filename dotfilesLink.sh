#!/bin/sh

# !!!attention!!!
# this script remove following files!
if test -f ~/.config/fish/config.fish;
	rm ~/.config/fish/config.fish
end
if test -f  ~/.tmux.conf;
	rm ~/.tmux.conf
end

if test -f ~/.tmux.conf;
	rm ~/.tmux.conf
end

if test -f ~/.vimrc;
	rm ~/.vimrc
end

ln -sf ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vimrc ~/.vimrc
