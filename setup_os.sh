#!/bin/bash

# Cross-platform package installation script
# Usage: install <package_name> [linux_package_name]

install() {
    echo "------------------------------"
    local package_name="$1"
    local linux_package_name="${2:-$1}"  # Use first arg if second not provided

    if [[ -z "$package_name" ]]; then
        echo "Error: Package name required"
        return 1
    fi

    # Detect OS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS - use Homebrew
        if ! command -v brew &> /dev/null; then
            echo "Error: Homebrew is not installed"
            return 1
        fi

        # Check if already installed
        if brew list "$package_name" &> /dev/null; then
            echo "$package_name: already installed"
            return 0
        fi

        # Try to install
        echo "Installing $package_name with Homebrew..."
        if brew install "$package_name"; then
            echo "$package_name: installed successfully"
        else
            echo "$package_name: package not found or installation failed"
            return 1
        fi

    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux - use apt
        if ! command -v apt &> /dev/null; then
            echo "Error: apt is not available"
            return 1
        fi

        # Check if already installed
        if dpkg -l | grep -q "^ii  $linux_package_name "; then
            echo "$linux_package_name: already installed"
            return 0
        fi

        # Try to install
        echo "Installing $linux_package_name with apt..."
        if sudo apt install -y "$linux_package_name"; then
            echo "$linux_package_name: installed successfully"
        else
            echo "$linux_package_name: package not found or installation failed"
            return 1
        fi

    else
        echo "Error: Unsupported OS type: $OSTYPE"
        return 1
    fi
}

# Package installations
install btop
install bat
install lazydocker
install lazygit
install fd fd-find  # Different package name on Linux
install ripgrep
