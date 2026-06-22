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

echo "Installing starship configuration..."
stow -t "$HOME" starship

# --no-folding keeps ~/.config/hunk a real directory so that hunk's runtime
# state.json (written next to config.toml) is not symlinked into this repo.
echo "Installing hunk configuration..."
stow --no-folding -t "$HOME" hunk

echo "Stow installation complete!"
echo "Run ./setup-tools.sh to install OS-specific dependencies"
echo "Run ./post-install.sh to bootstrap plugins"