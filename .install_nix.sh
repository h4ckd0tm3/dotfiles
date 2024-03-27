#!/bin/zsh

# Install Nix Package Manager
# CHeck if nix is installed
if ! command -v nix &> /dev/null
then
    echo "Nix is not installed. Installing..."
    sh <(curl -L https://nixos.org/nix/install)
else
    echo "Nix is already installed. Skipping..."
fi

# Get Nix config
echo "Cloning Nix config..."
[ ! -d "$HOME/nixconfig" ] && git clone --bare git@github.com:h4ckd0tm3/nixconfig.git $HOME/nixconfig
git --git-dir=$HOME/nixconfig/ --work-tree=$HOME checkout master