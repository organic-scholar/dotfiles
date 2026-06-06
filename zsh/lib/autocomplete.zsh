zstyle ':autocomplete:*' min-input 2
# Use fuzzy matching
zstyle ':autocomplete:*' fuzzy-search yes

# How many history entries to show ABOVE regular completions
zstyle ':autocomplete:history-search:*' list-lines 5
zstyle ':autocomplete:*' list-delay 0.4

# How many regular completions to show BELOW history
zstyle ':autocomplete:*' list-lines 8

# Use menu selection immediately
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-select

# Show recent history entries first
# zstyle ':autocomplete:tab:*' fzf-completion yes
