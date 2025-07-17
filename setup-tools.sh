#!/bin/bash

set -e

echo "Setting up OS-specific tools and dependencies..."

# Check if we're on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS, installing gnu-sed if needed..."
    hash gsed 2>/dev/null || {
        echo "Installing gnu-sed via Homebrew..."
        brew install gnu-sed
    }
    echo "gnu-sed is available"
else
    echo "Non-macOS system detected, skipping gnu-sed installation"
fi

# Create bin directory if it doesn't exist
if [ ! -d "$HOME/bin" ]; then
    echo "Creating $HOME/bin directory..."
    mkdir -p "$HOME/bin"
fi

# Install Oh My Zsh if it doesn't exist
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "Oh My Zsh installed"
else
    echo "Oh My Zsh already installed"
fi

# Install zsh-autosuggestions if not present
if [ ! -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    echo "Installing zsh-autosuggestions..."
    brew install zsh-autosuggestions
    echo "zsh-autosuggestions installed"
else
    echo "zsh-autosuggestions already installed"
fi

# Install fzf if not present
if ! command -v fzf &> /dev/null; then
    echo "Installing fzf..."
    brew install fzf
    echo "fzf installed"
else
    echo "fzf already installed"
fi

# Install tmux plugin manager (tpm) if not present
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing tmux plugin manager (tpm)..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "tpm installed"
else
    echo "tpm already installed"
fi

echo "Setup tools complete!"