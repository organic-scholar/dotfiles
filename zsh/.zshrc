export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=~/dotfiles/zsh/custom
export ZSH_THEME="robbyrussell"

source "$HOME/dotfiles/zsh/paths.sh"
source "$HOME/dotfiles/zsh/alises.sh"
source "$HOME/dotfiles/zsh/compinit.sh"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source "$HOME/.cargo/env"
