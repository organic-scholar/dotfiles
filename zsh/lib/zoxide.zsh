if command -v zoxide >/dev/null 2>&1; then
  export _ZO_EXCLUDE_DIRS="/tmp:/var:/proc/:/sys:/node_modules:/.git"
  eval "$(zoxide init zsh)"
  alias zz='z'
  alias zi='zi'
  alias za='zoxide add'
  alias zq='zoxide query'
  alias zr='zoxide remove'
  alias cd='z'
fi

