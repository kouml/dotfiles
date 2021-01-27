#!/bin/bash

confirm() {
    # call with a prompt string or use a default
    echo "[override files]"
    echo -e ".bashrc .gitconfig .tmux.conf .vimrc .zpreztorc .zshrc .zshrc_common .zshrc_home .zshrc_office \\n"
    read -r -p "${1:-Are you sure to override above local files? [Y/n]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

install_prezto() {
    DIR="$HOME/.zprezto"
    if [ -d "$DIR" ]; then
        echo "skip install zprezto"
    else
        echo "install zprezto"
        git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
        chsh -s /bin/zsh
    fi
}

update_profile_for_powershell() {
    if [ `uname -r | grep -i 'microsoft'` ]; then
        DIR="/mnt/c/Users/$(whoami)"
        cp profile.ps1 $DIR
        echo "updated profile.ps1 for powershell"
    fi
}


if confirm ; then
    echo "setup in local"
    cp .bashrc .gitconfig .tmux.conf .vimrc .zpreztorc .zshrc .zshrc_common .zshrc_home .zshrc_office ~;
    install_prezto;
    update_profile_for_powershell;
else
    echo "failed"
fi

