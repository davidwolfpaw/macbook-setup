#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to check if Oh My Zsh is installed
check_oh_my_zsh_installed() {
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        echo "Oh My Zsh is already installed."
        return 0
    else
        echo "Oh My Zsh is not installed."
        return 1
    fi
}

# Function to check if the current shell is Zsh
check_shell_is_zsh() {
    if [[ "$SHELL" == "$(which zsh)" ]]; then
        echo "The default shell is already Zsh."
        return 0
    else
        echo "The default shell is not Zsh."
        return 1
    fi
}

# Function to install Oh My Zsh
install_oh_my_zsh() {
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || {
        echo "Oh My Zsh installation failed."
        exit 1
    }
    echo "Oh My Zsh installed successfully."
}

# Function to change the default shell to Zsh
change_shell_to_zsh() {
    echo "Changing the default shell to Zsh..."
    chsh -s "$(which zsh)"
    echo "Default shell changed to Zsh. Please log out and log back in for the change to take effect."
}

# Main script
if ! check_oh_my_zsh_installed; then
    install_oh_my_zsh
fi

if ! check_shell_is_zsh; then
    change_shell_to_zsh
else
    echo "No changes to the default shell needed."
fi
