export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/dotfiles/zsh/custom"
#export ZSH_THEME="robbyrussell"

export ZSH_THEME="spaceship"


# RPS1='[aws:${AWS_PROFILE:-none}] [eks:$(kubectx_prompt_info)]'

source "$HOME/dotfiles/zsh/paths.zsh"
source "$HOME/dotfiles/zsh/aliases.zsh"
source "$HOME/dotfiles/zsh/compinit.zsh"
source "$HOME/dotfiles/zsh/prompt.zsh"
source "$HOME/dotfiles/zsh/zoxide.zsh"
source "$HOME/dotfiles/zsh/nvim.zsh"
source "$HOME/dotfiles/zsh/aws.zsh"

plugins=(git zsh-autosuggestions aws kubectl kubectx)

source $ZSH/oh-my-zsh.sh
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

bindkey -v

