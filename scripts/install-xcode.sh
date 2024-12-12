#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to check if Xcode is installed
check_xcode_installed() {
    if xcode-select -p &>/dev/null; then
        echo "Xcode Command Line Tools are already installed."
        return 0
    else
        echo "Xcode Command Line Tools are not installed."
        return 1
    fi
}

# Function to install Xcode Command Line Tools
install_xcode() {
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install

    # Wait for user to complete the installation
    echo "Please complete the installation in the pop-up window."
    read -p "Press Enter once Xcode Command Line Tools installation is complete..."
}

# Function to accept the Xcode license agreement
accept_xcode_license() {
    echo "Accepting the Xcode license agreement..."
    sudo xcodebuild -license accept
    echo "Xcode license agreement accepted."
}

# Install Xcode
if ! check_xcode_installed; then
    install_xcode
    accept_xcode_license
else
    echo "Xcode setup is already complete."
fi
