#!/bin/bash

set -e

echo "Running post-installation plugin setup..."

# Bootstrap lazy.nvim and install plugins
echo "Bootstrapping Neovim plugins with lazy.nvim..."
nvim --headless "+Lazy! sync" +qa

# Install Mason packages
echo "Installing Mason packages..."
nvim --headless "+MasonInstallAll" +qa

echo "Post-installation setup complete!"
echo "Your dotfiles are now fully configured with GNU Stow!"