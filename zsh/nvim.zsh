if [[ -n $NVIM ]]; then
  printf '\e[6 q'  # Set cursor immediately on terminal open

  function zle-keymap-select {
    case $KEYMAP in
      vicmd) printf '\e[2 q' ;;
      *)     printf '\e[6 q' ;;
    esac
  }
  zle -N zle-keymap-select

  function zle-line-init {
    printf '\e[6 q'
  }
  zle -N zle-line-init
fi
