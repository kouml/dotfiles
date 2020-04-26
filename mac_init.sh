#!/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install hub
brew install tmux
brew install peco
brew install --HEAD pyenv-virtualenv

git clone https://github.com/nvm-sh/nvm.git ~/.nvm
git clone https://github.com/tokuhirom/plenv.git ~/.plenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/syndbg/goenv.git ~/.goenv