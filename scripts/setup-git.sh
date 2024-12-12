#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Determine the base directory
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Path to the .gitignore file
GITIGNORE_FILE="$BASE_DIR/configs/.gitignore"

# Set up the global .gitignore
setup_gitignore() {
    echo "Setting up global .gitignore..."

    if [[ -f "$GITIGNORE_FILE" ]]; then
        echo "Using .gitignore file found at $GITIGNORE_FILE."

        # Copy the existing .gitignore file to the global location
        GITIGNORE_GLOBAL="$HOME/.gitignore_global"
        cp "$GITIGNORE_FILE" "$GITIGNORE_GLOBAL"

        # Set the global .gitignore
        git config --global core.excludesfile "$GITIGNORE_GLOBAL"
        echo "Global .gitignore configured at $GITIGNORE_GLOBAL."
    else
        echo "Error: .gitignore file not found at $GITIGNORE_FILE."
        exit 1
    fi
}

# Set up global Git configs
setup_git_configs() {
    echo "Setting up global Git configs..."

    # Prompt user for name and email
    read -p "Enter your Git username: " GIT_USERNAME
    read -p "Enter your Git email: " GIT_EMAIL
    read -p "Enter your GitHub username: " GITHUB_USERNAME

    # Set the global username, email, and github username
    git config --global user.name "$GIT_USERNAME"
    git config --global user.email "$GIT_EMAIL"
    git config --global github.user "$GITHUB_USERNAME"

    # Optional global configurations
    git config --global init.defaultBranch main
    git config --global pull.rebase true
    git config --global color.ui auto
    git config --global color.diff-highlight.newhighlight green bold 22
    git config --global color.diff-highlight.newnormal green bold
    git config --global color.diff-highlight.oldhighlight red bold 52
    git config --global color.diff-highlight.oldnormal red bold
    git config --global color.ui true
    git config --global core.autocrlf input
    git config --global core.editor code -wait
    git config --global core.pager diff-so-fancy | less --tabs=4 -RFX
    git config --global credential.helper osxkeychain
    git config --global http.sslverify true
    git config --global init.defaultbranch main
    git config --global merge.conflictstyle diff3
    git config --global push.default current

    echo "Global Git configs set:"
    git config --global --list
}

setup_gitignore
setup_git_configs
