#!/bin/bash

# Cross-platform package installation script
# Usage: install <package_name> [linux_package_name]

install() {
    echo "------------------------------"
    local package_name="$1"
    local linux_package_name="${2:-$1}"  # Use first arg if second not provided

    if [ -z "$package_name" ]; then
        echo "Error: Package name required"
        return 1
    fi

    # Detect OS using uname (POSIX-compliant)
    OS="$(uname -s)"
    case "$OS" in
        Darwin)
            # macOS - use Homebrew
            if ! command -v brew > /dev/null 2>&1; then
                echo "Error: Homebrew is not installed"
                return 1
            fi

            # Check if already installed
            if brew list "$package_name" > /dev/null 2>&1; then
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
            ;;

        Linux)
            # Linux - use apt
            if ! command -v apt > /dev/null 2>&1; then
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
            ;;

        *)
            echo "Error: Unsupported OS type: $OS"
            return 1
            ;;
    esac
}

# Package installations
install btop
install bat
install fd fd-find  # Different package name on Linux
install ripgrep
install tmux

# lazygit (custom install - not in apt)
echo "------------------------------"
if command -v lazygit > /dev/null 2>&1; then
    echo "lazygit: already installed"
else
    echo "Installing lazygit..."
    OS="$(uname -s)"
    case "$OS" in
        Darwin)
            brew install lazygit
            ;;
        Linux)
            LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
            curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
            tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
            sudo install /tmp/lazygit -D -t /usr/local/bin/
            rm -f /tmp/lazygit.tar.gz /tmp/lazygit
            ;;
    esac
    echo "lazygit: installed successfully"
fi

# lazydocker (custom install - not in apt)
echo "------------------------------"
if command -v lazydocker > /dev/null 2>&1; then
    echo "lazydocker: already installed"
else
    echo "Installing lazydocker..."
    OS="$(uname -s)"
    case "$OS" in
        Darwin)
            brew install lazydocker
            ;;
        Linux)
            curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
            ;;
    esac
    echo "lazydocker: installed successfully"
fi

# neovim (use PPA for latest version on Linux)
echo "------------------------------"
if command -v nvim > /dev/null 2>&1; then
    echo "neovim: already installed ($(nvim --version | head -1))"
else
    echo "Installing neovim..."
    OS="$(uname -s)"
    case "$OS" in
        Darwin)
            brew install neovim
            ;;
        Linux)
            sudo add-apt-repository -y ppa:neovim-ppa/unstable
            sudo apt-get update
            sudo apt-get install -y neovim
            ;;
    esac
    echo "neovim: installed successfully"
fi

# LazyVim (neovim config)
echo "------------------------------"
if [ -d "$HOME/.config/nvim" ]; then
    echo "LazyVim: already installed"
else
    echo "Installing LazyVim..."
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
    echo "LazyVim: installed successfully"
fi

# Tmux plugins (manual install)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "------------------------------"
    echo "Installing Tmux Plugin Manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "TPM: installed successfully"
else
    echo "------------------------------"
    echo "TPM: already installed"
fi

# Install tmux plugins via TPM
if [ -f "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]; then
    echo "Installing tmux plugins..."
    ~/.tmux/plugins/tpm/bin/install_plugins
fi
