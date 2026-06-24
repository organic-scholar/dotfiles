# Variable definitions
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
ZSH_LIB="${HOME}/dotfiles/zsh/lib"

# Source local libraries
source "$ZSH_LIB/aliases.zsh"
source "$ZSH_LIB/paths.zsh"
source "$ZSH_LIB/history.zsh"
source "$ZSH_LIB/prompt.zsh"
source "$ZSH_LIB/zoxide.zsh"
source "$ZSH_LIB/eza.zsh"
source "$ZSH_LIB/nvim.zsh"
source "$ZSH_LIB/aws.zsh"
source "$ZSH_LIB/zellij.zsh"

# Initialize Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Snippets and plugin configurations
zi snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZP::git
zinit snippet OMZP::vi-mode
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Completions
zinit light zsh-users/zsh-completions
source "$ZSH_LIB/compinit.zsh"

# Additional plugins
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

# Completion styling and keybindings
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' list-choices false

# Avoid ambiguous beep/list behavior
unsetopt LIST_AMBIGUOUS
unsetopt AUTO_LIST
unsetopt BASH_AUTO_LIST

# Key bindings
bindkey '^I' menu-complete
bindkey '^@' fzf-tab-complete

export EDITOR=nvim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Tool initializations (last)
eval "$(starship init zsh)"
source <(fzf --zsh)

#q Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zdharma-continuum/zinit-annex-as-monitor \
#     zdharma-continuum/zinit-annex-bin-gem-node \
#     zdharma-continuum/zinit-annex-patch-dl \
#     zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
eval "$(mise activate zsh)"

