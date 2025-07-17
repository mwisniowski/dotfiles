#!/bin/sh
git clone --recursive https://github.com/mwisniowski/dotfiles.git .dotfiles && cd .dotfiles && ./setup-tools.sh && ./stow-install.sh && ./post-install.sh
