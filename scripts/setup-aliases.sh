#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Determine the base directory
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Path to the aliases file
ALIASES_FILE="$BASE_DIR/configs/zsh-aliases.txt"

# Path to the oh-my-zsh custom aliases file
ZSH_CUSTOM_ALIASES="$HOME/.oh-my-zsh/custom/aliases.zsh"

# Function to copy aliases file
setup_zsh_aliases() {
    echo "Setting up zsh aliases..."

    if [[ -f "$ALIASES_FILE" ]]; then
        echo "Copying aliases from $ALIASES_FILE to $ZSH_CUSTOM_ALIASES..."

        # Ensure the custom directory exists
        mkdir -p "$(dirname "$ZSH_CUSTOM_ALIASES")"

        # Copy the aliases file to the Zsh custom directory
        cp "$ALIASES_FILE" "$ZSH_CUSTOM_ALIASES"

        echo "Aliases have been copied. Reload your shell or run 'source ~/.zshrc' to apply changes."
    else
        echo "Error: Aliases file not found at $ALIASES_FILE."
        exit 1
    fi
}

setup_zsh_aliases
