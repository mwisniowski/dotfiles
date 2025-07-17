#!/bin/bash

DOTFILES_FOLDER=$HOME/.dotfiles

##############################################
# Bash
##############################################
BASH_IT_DST=$HOME/.bash-it
if [ -d $BASH_IT_DST ]; then
    rm -rf $BASH_IT_DST
fi
ln -sf $DOTFILES_FOLDER/bash-it $BASH_IT_DST
ln -sf $DOTFILES_FOLDER/bash/bashrc $HOME/.bashrc

##############################################
# diffconflicts
##############################################
if [ ! -d $HOME/bin ]; then
    mkdir $HOME/bin
fi
ln -sf $DOTFILES_FOLDER/bin/diffconflicts $HOME/bin/
if [[ $OSTYPE == "darwin"* ]]; then
    hash gsed 2>/dev/null || brew install gnu-sed
fi

git config --global merge.tool diffconflicts
git config --global mergetool.keepBackup false
git config --global mergetool.diffconflicts.cmd 'diffconflicts vim $BASE $LOCAL $REMOTE $MERGED'
git config --global mergetool.diffconflicts.trustExitCode true

##############################################
# Bin
##############################################
if [ ! -d $HOME/bin ]; then
    mkdir $HOME/bin
fi
ln -sf $DOTFILES_FOLDER/bin $HOME/bin

##############################################
# Tmux
##############################################

ln -sf $DOTFILES_FOLDER/tmux/tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.tmux/plugins
ln -sf $DOTFILES_FOLDER/tpm $HOME/.tmux/plugins/tpm

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
# install youcompleteme plugin
YCM_INSTALLER=$VIM_FOLDER/bundle/YouCompleteMe/install.py
[[ -s $YCM_INSTALLER ]] && python3 $YCM_INSTALLER

##############################################
# Fzf
##############################################

# $DOTFILES_FOLDER/fzf/install
