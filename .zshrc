# switch by env flag
export WORKING_ENV='home' # 'home', 'office'

# load prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  echo "loading ${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# common settings
if [[ -s "${ZDOTDIR:-$HOME}/.zshrc_common" ]]; then
  echo "loading ${ZDOTDIR:-$HOME}/.zshrc_common"
  source "${ZDOTDIR:-$HOME}/.zshrc_common"
fi

# case setttings
if [[ WORKING_ENV == 'office' ]]; then
  echo "loading ${ZDOTDIR:-$HOME}/.zshrc_office"
  source "${ZDOTDIR:-$HOME}/.zshrc_office"
elif [[ WORKING_ENV == 'home' ]] ; then
  echo "loading ${ZDOTDIR:-$HOME}/.zshrc_home"
  source "${ZDOTDIR:-$HOME}/.zshrc_home"
fi
