#! /usr/bin/env bash

ln -sf $PWD/.vimrc ~/
cp .vimrc.local ~/
ln -sf $PWD/.tmux.conf ~/
ln -sf $PWD/.tmux.conf.local ~/
ln -sf $PWD/.zshrc ~/
ln -sf $PWD/.gitconfig ~/
ln -sf $PWD/coc-settings.json ~/.config/nvim/
ln -sf ~/.vim ~/.config/nvim
ln -sf ~/.vimrc ~/.config/nvim/init.vim
ln -sf $PWD/kitty.conf ~/.config/kitty/
