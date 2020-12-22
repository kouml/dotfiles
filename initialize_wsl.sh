#!/bin/bash
confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure to initialize WSL(Ubuntu)? [Y/n]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

if confirm ; then
    echo "initialize WSL(ubuntu) after clean install"
    sudo apt-get update

    sudo apt-get install -y hub
    sudo apt-get install -y tmux
    sudo apt-get install -y peco
    sudo apt-get install -y zsh
    sudo apt-get install --HEAD pyenv-virtualenv

    git clone https://github.com/nvm-sh/nvm.git ~/.nvm
    git clone https://github.com/tokuhirom/plenv.git ~/.plenv
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    git clone https://github.com/syndbg/goenv.git ~/.goenv
else
    echo "failed"
fi


