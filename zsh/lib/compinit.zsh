autoload -Uz compinit
autoload -Uz bashcompinit

# Portable zcompdump date check: works on macOS (BSD stat) and Linux (GNU stat).
ZCOMP="$HOME/.zcompdump"
zcomp_day=""
if [ -f "$ZCOMP" ]; then
  # Try BSD stat (macOS)
  if zcomp_day=$(stat -f '%Sm' -t '%j' "$ZCOMP" 2>/dev/null); then
    true
  else
    # Try GNU stat (Linux) -> get epoch then convert to day-of-year
    if zcomp_mtime=$(stat -c '%Y' "$ZCOMP" 2>/dev/null); then
      zcomp_day=$(date -d "@$zcomp_mtime" +%j 2>/dev/null || true)
    fi
  fi
fi

if [ -z "$zcomp_day" ] || [ "$(date +%j)" != "$zcomp_day" ]; then
  compinit
else
  compinit -C
fi


bashcompinit

