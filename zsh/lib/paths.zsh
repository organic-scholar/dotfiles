PATH="$HOME/.local/share/mise/shims:$PATH"
PATH="$HOME/go/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

[[ "$OSTYPE" == "darwin"* ]] && PATH="/opt/homebrew/bin:$PATH"

function print_path() {
  echo "$PATH" | tr ':' '\n'
}
export PATH="$PATH"
