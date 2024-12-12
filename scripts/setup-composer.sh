#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Determine the base directory
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Path to the composer-global-packages.txt file
COMPOSER_PACKAGES_FILE="$BASE_DIR/configs/composer-global-packages.txt"

# Install Composer
install_composer() {
    echo "Installing Composer..."

    # Check if Composer is already installed
    if ! command -v composer &>/dev/null; then
        # Download and install Composer
        EXPECTED_SIGNATURE="$(curl -s https://composer.github.io/installer.sig)"
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
        ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

        if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then
            echo "ERROR: Invalid installer signature."
            rm composer-setup.php
            exit 1
        fi

        php composer-setup.php --quiet
        rm composer-setup.php
        mv composer.phar /usr/local/bin/composer
        echo "Composer installed successfully."
    else
        echo "Composer is already installed."
    fi
}

# Function to install global Composer packages
install_composer_packages() {
    echo "Installing global Composer packages..."

    if [[ -f "$COMPOSER_PACKAGES_FILE" ]]; then
        echo "Installing global Composer packages from $COMPOSER_PACKAGES_FILE..."
        while IFS= read -r package; do
            if [[ -n "$package" ]]; then
                composer global require "$package"
            fi
        done < "$COMPOSER_PACKAGES_FILE"
        echo "Global Composer packages installed successfully."
    else
        echo "Error: composer-global-packages.txt file not found at $COMPOSER_PACKAGES_FILE."
        exit 1
    fi
}

install_composer
install_composer_packages
