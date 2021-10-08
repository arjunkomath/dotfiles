#!/bin/bash

installing() {
    printf "\n\nInstalling -> $@"
    printf "\n========================================\n"
}

info() {
    printf "\n\n$@"
    printf "\n========================================\n"
}

installing "Command Line Tools"
xcode-select --install

info "Verifying -> Command Line Tools"
xcode-select -p

installing "ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

installing "homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

installing "nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

info "exporting nvm"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

installing "node"
nvm install 14.17.4

installing "yarn"
npm i -g yarn

installing "vscode"
brew install --cask visual-studio-code

installing "iterm"
brew install --cask iterm2
