#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Determine the base directory
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Path to the Brewfile
GITIGNORE_FILE="$BASE_DIR/configs/Brewfile"

# Function to check if Homebrew is installed
install_homebrew() {
    if ! command -v brew &>/dev/null; then
        echo "Homebrew is not installed. Installing now..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "Homebrew installed successfully."
    else
        echo "Homebrew is already installed."
    fi
}

# Function to install the Brewfile
install_brewfile() {
    if [[ -f "$BREWFILE" ]]; then
        echo "Installing packages from Brewfile..."
        brew bundle install --file="$BREWFILE"
        echo "Brewfile installation complete."
    else
        echo "Brewfile not found at $BREWFILE."
        exit 1
    fi
}

install_homebrew
install_brewfile
