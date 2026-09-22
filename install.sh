#!/bin/bash
set -euo pipefail

# Helper function to print step titles
log() { echo -e "\n\033[1;32m==>\033[0m \033[1m$1\033[0m"; }

# Detect the OS
OS_TYPE="$(uname -s)"


install_packages() {
    log "Detecting OS: $OS_TYPE"
    case "$OS_TYPE" in
        Linux*)
            if command -v apit-get &> /dev/null; then
                log "Updating apt packages..."
                sudo apt update && sudo apt upgrade -y

                log "Installing core packages via apt..."
                sudo apt install -y git curl wget zsh vim
            else
                echo "Unsupported Linux package manager. Please use a Debian/Ubuntu based OS."
                exit 1
            fi
            ;;
        Darwin*)
            if ! command -v brew &> /dev/null; then
                log "Installing homebrew..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

                # Load Homebrew into PATH for Apple Silicon or Intel
                if [[ -f /opt/homebrew/bin/brew ]]; then
                    eval "$(/opt/homebrew/bin/brew shellenv)"
                elif [[ -f /usr/local/bin/brew ]]; then
                    eval "$(/usr/local/bin/brew shellenv)"
                fi
            fi

            log "Updating HOmebrew..."
            brew update

            log "Installing core packages via brew..."
            brew install git curl wget zsh vim
            ;;
        *)
            echo "Unsupported operating system: $OS_TYPE"
            exit 1
            ;;
    esac
}


# Package installation
install_packages

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log "Installing oh my zsh"
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" --unattended
else
    log "Oh my zsh is already installed, skipping..."
fi


log "Deploying configuration files..."
if [ -f "src/zshrc" ]; then
    cp src/zshrc ~/.zshrc
fi

if [ -f "src/vimrc" ]; then
    cp src/vimrc ~/.vimrc
fi

# Install vundle if not already installed
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    log "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    log "Vundle is already installed, skipping..."
fi

log "Installing vim plugins"
vim +PluginInstall +qall

log "Setup complte! Change your default shell with: chsh -s \$(which zsh)"
