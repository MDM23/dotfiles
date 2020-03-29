ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="gentoo"
DISABLE_AUTO_UPDATE="true"

plugins=()

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

prompt() {
    PS1="$(powerline-rs --shell zsh $?)"
}

precmd_functions+=(prompt)
