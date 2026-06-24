# Only configure if we are actively running inside a Zellij session
if [[ -n "$ZELLIJ" ]]; then

  # 1. State: Sitting at the Prompt -> Show Current Directory
  set_tab_to_dir() {
    # Extract just the folder name (the tail). E.g., /home/user/code -> code
    local dir_name="${PWD:t}"
    # Handle the home directory gracefully so it shows ~ instead of an empty string
    if [[ "$PWD" == "$HOME" ]]; then
      dir_name="~"
    fi

    # Quietly push the directory name to the Zellij tab in the background
    zellij action rename-tab "$dir_name" &!
  }

  # Register our functions to Zsh's internal hook arrays
  autoload -U add-zsh-hook
  add-zsh-hook precmd set_tab_to_dir
fi
