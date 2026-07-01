# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
source "$HOME/dotfiles/zsh/lib/paths.zsh"
[ -d "$HOME/.cargo" ] && source "$HOME/.cargo/env"
# Source local libraries
# Initialize mise (sourced by ALL zsh shells, including non-interactive ones)
eval "$(mise activate zsh)"

