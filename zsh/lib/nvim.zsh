VI_MODE_SET_CURSOR=true
# if [[ -n $NVIM ]]; then
#   printf '\e[6 q'  # Set cursor immediately on terminal open
#
#   function zle-keymap-select {
#     case $KEYMAP in
#       vicmd) printf '\e[2 q' ;;
#       *)     printf '\e[6 q' ;;
#     esac
#   }
#   zle -N zle-keymap-select
#
#   function zle-line-init {
#     printf '\e[6 q'
#   }
#   zle -N zle-line-init
# fi

# if [[ -n $NVIM ]]; then
#   function _cursor_bar() {
#     printf '\e[6 q'
#   }
#
#   function _cursor_block() {
#     printf '\e[2 q'
#   }
#
#   function zle-keymap-select() {
#     case $KEYMAP in
#       vicmd) _cursor_block ;;
#       *)     _cursor_bar ;;
#     esac
#   }
#   zle -N zle-keymap-select
#
#   function zle-line-init() {
#     zle-keymap-select
#   }
#   zle -N zle-line-init
#
#   function precmd() {
#     _cursor_bar
#   }
#
#   function preexec() {
#     _cursor_block
#   }
#
#   _cursor_bar
# fi
#
