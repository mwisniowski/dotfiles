#!/bin/sh

DOTFILES_FOLDER=$HOME/.dotfiles

##############################################
# Bash
##############################################
ln -sf $DOTFILES_FOLDER/bash-it $HOME/.bash_it
ln -sf $DOTFILES_FOLDER/bash/bashrc $HOME/.bashrc

##############################################
# Vim
##############################################

VIM_FOLDER=$HOME/.vim
# vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vimrc
if [ -e $HOME/.vimrc ]; then
  mv $HOME/.vimrc $HOME/.vimrc.bac
fi
ln -sf $DOTFILES_FOLDER/vim/vimrc $HOME/.vimrc
ln -sf $DOTFILES_FOLDER/vim/UltiSnips $VIM_FOLDER/

vim +PlugInstall +qall

##############################################
# Tmux
##############################################

ln -sf $DOTFILES_FOLDER/tmux/tmux.conf $HOME/.tmux.conf

##############################################
# Fzf
##############################################

# $DOTFILES_FOLDER/fzf/install
