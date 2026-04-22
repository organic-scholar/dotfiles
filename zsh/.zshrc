export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/dotfiles/zsh/custom"
#export ZSH_THEME="robbyrussell"

export ZSH_THEME="spaceship"

# Spaceship settings
SPACESHIP_PROMPT_ASYNC=true
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="⚡"

# Minimal spaceship sections for performance
SPACESHIP_PROMPT_ORDER=(
  time
  user
  dir
  git
  line_sep
  char
)

source "$HOME/dotfiles/zsh/paths.zsh"
source "$HOME/dotfiles/zsh/aliases.zsh"
source "$HOME/dotfiles/zsh/compinit.zsh"
source "$HOME/dotfiles/zsh/zoxide.zsh"
source "$HOME/dotfiles/zsh/nvim.zsh"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source "$HOME/.cargo/env"

bindkey -v

