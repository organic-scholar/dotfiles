ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
ZSH_LIB="${HOME}/dotfiles/zsh/lib"

source "$ZSH_LIB/aliases.zsh"
source "$ZSH_LIB/paths.zsh"
source "$ZSH_LIB/history.zsh"
source "$ZSH_LIB/prompt.zsh"
source "$ZSH_LIB/zoxide.zsh"
source "$ZSH_LIB/eza.zsh"
source "$ZSH_LIB/nvim.zsh"
source "$ZSH_LIB/aws.zsh"

source "${ZINIT_HOME}/zinit.zsh"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)


zi snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZP::git
zinit snippet OMZP::vi-mode
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit light zsh-users/zsh-completions
source "$ZSH_LIB/compinit.zsh"


zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab


eval "$(starship init zsh)"
source <(fzf --zsh)

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'


# Optional: avoid ambiguous beep/list behavior
unsetopt LIST_AMBIGUOUS
unsetopt AUTO_LIST
unsetopt BASH_AUTO_LIST

bindkey '^I' menu-complete

# 3. Disable the visual completion list from showing up
zstyle ':completion:*' list-choices false
bindkey '^@' fzf-tab-complete

