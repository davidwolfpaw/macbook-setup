#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Determine the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Paths to the sub-scripts
BREW_INSTALL_SCRIPT="$SCRIPT_DIR/scripts/install-brew.sh"
XCODE_INSTALL_SCRIPT="$SCRIPT_DIR/scripts/install-xcode.sh"
OMZSH_INSTALL_SCRIPT="$SCRIPT_DIR/scripts/install-omzsh.sh"
GIT_CONFIG_SCRIPT="$SCRIPT_DIR/scripts/setup-git.sh"
NVM_INSTALL_SCRIPT="$SCRIPT_DIR/scripts/setup-nvm.sh"
COMPOSER_INSTALL_SCRIPT="$SCRIPT_DIR/scripts/setup-composer.sh"
ZSH_ALIASES_SCRIPT="$SCRIPT_DIR/scripts/setup-aliases.sh"
MACOS_PREFS_SCRIPT="$SCRIPT_DIR/scripts/macos-prefs.sh"

# Let's get started.
cd ~

# Install Xcode
# Runs scripts/install-xcode.sh
echo "Executing xcode install script..."
if [[ -f "$XCODE_INSTALL_SCRIPT" ]]; then
    bash "$XCODE_INSTALL_SCRIPT"
else
    echo "Error: Script $XCODE_INSTALL_SCRIPT not found"
    exit 1
fi

# Setup Git configs and gitignore
# Runs scripts/setup-git.sh
echo "Executing git config script..."
if [[ -f "$GIT_CONFIG_SCRIPT" ]]; then
    bash "$GIT_CONFIG_SCRIPT"
else
    echo "Error: Script $GIT_CONFIG_SCRIPT not found"
    exit 1
fi

# Install Homebrew and all apps on Homebrew.
# Runs scripts/install-brew.sh
echo "Executing Brewfile installation script..."
if [[ -f "$BREW_INSTALL_SCRIPT" ]]; then
    bash "$BREW_INSTALL_SCRIPT"
else
    echo "Error: Script $BREW_INSTALL_SCRIPT not found"
    exit 1
fi

# Install Oh My ZSH!
# Runs scripts/install-omzsh.sh
echo "Executing Oh My Zsh! install script..."
if [[ -f "$OMZSH_INSTALL_SCRIPT" ]]; then
    bash "$OMZSH_INSTALL_SCRIPT"
else
    echo "Error: Script $OMZSH_INSTALL_SCRIPT not found"
    exit 1
fi

# Install ZSH aliases
# Runs scripts/setup-aliases.sh
echo "Installing ZSH aliases..."
if [[ -f "$ZSH_ALIASES_SCRIPT" ]]; then
    bash "$ZSH_ALIASES_SCRIPT"
else
    echo "Error: Script $ZSH_ALIASES_SCRIPT not found"
    exit 1
fi

# Finish setting up oh-my-zsh!
omz update

# Install Node Version Manager (nvm) and global nvm libs
# Runs scripts/setup-nvm.sh
echo "Installing Node Version Manager, Setting up Node.js, and global npm libraries..."
if [[ -f "$NVM_INSTALL_SCRIPT" ]]; then
    bash "$NVM_INSTALL_SCRIPT"
else
    echo "Error: Script $NVM_INSTALL_SCRIPT not found"
    exit 1
fi

# Install Composer and global packages
# Runs scripts/setup-composer.sh
echo "Installing Composer and global packages..."
if [[ -f "$COMPOSER_INSTALL_SCRIPT" ]]; then
    bash "$COMPOSER_INSTALL_SCRIPT"
else
    echo "Error: Script $COMPOSER_INSTALL_SCRIPT not found"
    exit 1
fi

# Install/Update System Prefs
# Runs scripts/macos-prefs.sh
echo "Executing System Preference script..."
if [[ -f "$MACOS_PREFS_SCRIPT" ]]; then
    bash "$MACOS_PREFS_SCRIPT"
else
    echo "Error: Script $MACOS_PREFS_SCRIPT not found"
    exit 1
fi

# Prevent duplicate PATH variables.
echo "typeset -U PATH" >>~/.zshrc
