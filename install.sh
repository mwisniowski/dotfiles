#!/bin/sh

DOTFILES_FOLDER=$HOME/.dotfiles

git submodule init $DOTFILES_FOLDER
git submodule update $DOTFILES_FOLDER

##############################################
# ZSH
##############################################
ln -sf $DOTFILES_FOLDER/oh-my-zsh $HOME/.omz
cp $DOTFILES_FOLDER/zsh/atlas.zsh-theme $DOTFILES_FOLDER/oh-my-zsh/custom

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
