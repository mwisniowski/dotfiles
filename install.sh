#!/bin/sh

DOTFILES_FOLDER=$HOME/.dotfiles

##############################################
# Bash
##############################################
ln -sf $DOTFILES_FOLDER/bash-it $HOME/.bash-it
ln -sf $DOTFILES_FOLDER/bash/bashrc $HOME/.bashrc


##############################################
# diffconflicts
##############################################
if [ ! -f $HOME/bin ]; then
    mkdir $HOME/bin
fi
ln -sf $DOTFILES_FOLDER/bin/diffconflicts $HOME/bin/
if [[ $OSTYPE == "darwin"* ]]; then
    hash gsed 2>/dev/null || { brew install gnu-sed }
fi

git config --global merge.tool diffconflicts
git config --global mergetool.keepBackup false
git config --global mergetool.diffconflicts.cmd 'diffconflicts vim $BASE $LOCAL $REMOTE $MERGED'
git config --global mergetool.diffconflicts.trustExitCode true

##############################################
# Tmux
##############################################

ln -sf $DOTFILES_FOLDER/tmux/tmux.conf $HOME/.tmux.conf

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
# Fzf
##############################################

# $DOTFILES_FOLDER/fzf/install
