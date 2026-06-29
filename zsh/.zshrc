# Variable definitions
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
ZSH_LIB="${HOME}/dotfiles/zsh/lib"

# Source local libraries
source "$ZSH_LIB/aliases.zsh"
# source "$ZSH_LIB/paths.zsh"
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

# # disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# # set descriptions format to enable group support
# # NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# # set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# # preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# # custom fzf flags
# # NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
# zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# # To make fzf-tab follow FZF_DEFAULT_OPTS.
# # NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
# zstyle ':fzf-tab:*' use-fzf-default-opts yes
# # switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'



# Additional plugins
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

# Completion styling and keybindings
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' list-choices false

# Avoid ambiguous beep/list behavior
unsetopt LIST_AMBIGUOUS
unsetopt AUTO_LIST
unsetopt BASH_AUTO_LIST

# Key bindings
bindkey '^I' autosuggest-accept
bindkey '\x1f' fzf-tab-complete



export EDITOR=nvim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Tool initializations (last)
eval "$(starship init zsh)"
# source <(fzf --zsh)


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/nauman/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
