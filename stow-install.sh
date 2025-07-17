#!/bin/bash

set -e

DOTFILES_FOLDER="$HOME/.dotfiles"
STOW_PACKAGES_DIR="$DOTFILES_FOLDER/stow-packages"

echo "Installing dotfiles with GNU Stow..."

# Change to the stow packages directory
cd "$STOW_PACKAGES_DIR"

# Install all packages
echo "Installing tmux configuration..."
stow -t "$HOME" tmux

echo "Installing neovim configuration..."
stow -t "$HOME" nvim

echo "Installing bin scripts..."
stow -t "$HOME" bin

echo "Installing git configuration..."
stow -t "$HOME" git

echo "Installing zsh configuration..."
stow -t "$HOME" zsh

echo "Stow installation complete!"
echo "Run ./setup-tools.sh to install OS-specific dependencies"
echo "Run ./post-install.sh to bootstrap plugins"