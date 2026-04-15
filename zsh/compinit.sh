autoload -Uz compinit
autoload -Uz bashcompinit

if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
  compinit
else
  compinit -C
fi
bashcompinit

complete -C $(which aws_completer) aws
