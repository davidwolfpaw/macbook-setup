#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Determine the base directory (assumes the structure from install.sh)
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Paths to config files in the configs directory
EDITORCONFIG_FILE="$BASE_DIR/configs/.editorconfig"
ZSHRC_FILE="$BASE_DIR/configs/.zshrc"
ZPROFILE_FILE="$BASE_DIR/configs/.zprofile"
ITERM2_SETTINGS="$BASE_DIR/configs/iterm2-settings.json"
VSCODE_KEYBINDINGS="$BASE_DIR/configs/vscode-keybindings.json"
VSCODE_SETTINGS="$BASE_DIR/configs/vscode-settings.json"

# Function to copy a config file
copy_config() {
    local source_file="$1"
    local destination_file="$2"
    local description="$3"

    if [[ -f "$source_file" ]]; then
        echo "Setting up $description..."
        cp "$source_file" "$destination_file"
        echo "$description has been configured at $destination_file."
    else
        echo "Error: $description file not found at $source_file."
    fi
}

# Function to load iTerm2 settings
setup_iterm2() {
    echo "Setting up iTerm2 settings..."

    if [[ -f "$ITERM2_SETTINGS" ]]; then
        # Set the preferences directory
        defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$BASE_DIR/configs"
        defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
        echo "iTerm2 settings configured. Restart iTerm2 to apply changes."
    else
        echo "Error: iTerm2 settings file not found at $ITERM2_SETTINGS."
    fi
}

# Function to load VS Code settings
setup_vscode() {
    echo "Setting up VS Code settings..."

    local vscode_settings_dir="$HOME/Library/Application Support/Code/User"
    mkdir -p "$vscode_settings_dir"

    if [[ -f "$VSCODE_SETTINGS" ]]; then
        cp "$VSCODE_SETTINGS" "$vscode_settings_dir/settings.json"
        echo "VS Code settings configured at $vscode_settings_dir/settings.json."
    else
        echo "Error: VS Code settings file not found at $VSCODE_SETTINGS."
    fi

    if [[ -f "$VSCODE_KEYBINDINGS" ]]; then
        cp "$VSCODE_KEYBINDINGS" "$vscode_settings_dir/keybindings.json"
        echo "VS Code keybindings configured at $vscode_settings_dir/keybindings.json."
    else
        echo "Error: VS Code keybindings file not found at $VSCODE_KEYBINDINGS."
    fi
}

# Main script
copy_config "$EDITORCONFIG_FILE" "$HOME/.editorconfig" "Global .editorconfig"
copy_config "$ZSHRC_FILE" "$HOME/.zshrc" "zsh configuration"
copy_config "$ZPROFILE_FILE" "$HOME/.zprofile" "zsh profile"
setup_iterm2
setup_vscode

echo "All configurations have been applied."
