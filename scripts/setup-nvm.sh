#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Determine the base directory
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Path to the npm-global-libs.txt file
NPM_LIBS_FILE="$BASE_DIR/configs/npm-global-libs.txt"

# Install NVM
install_nvm() {
    echo "Installing Node Version Manager (NVM)..."

    # Check if NVM is already installed
    if ! command -v nvm &>/dev/null; then
        # Download and install NVM
        git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

        # Source NVM to make it available in the current shell
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

        echo "NVM installed successfully."
    else
        echo "NVM is already installed."
    fi
}

# Install Node.js and global npm libraries
setup_node_and_npm() {
    echo "Setting up Node.js and global npm libraries..."

    # Load NVM in the current shell
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Install the latest Node.js LTS version
    echo "Installing the latest Node.js LTS version..."
    nvm install --lts
    nvm use --lts

    # Install global npm libraries
    if [[ -f "$NPM_LIBS_FILE" ]]; then
        echo "Installing global npm libraries from $NPM_LIBS_FILE..."
        xargs npm install -g < "$NPM_LIBS_FILE"
        echo "Global npm libraries installed successfully."
    else
        echo "Error: npm-global-libs.txt file not found at $NPM_LIBS_FILE."
        exit 1
    fi
}

install_nvm
setup_node_and_npm
