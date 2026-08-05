select-to-line-start() {
    MARK=$CURSOR
    zle beginning-of-line
    REGION_ACTIVE=1
}

zle -N select-to-line-start
bindkey $'\e[1;2H' select-to-line-start

select-to-line-end() {
    MARK=$CURSOR
    zle end-of-line
    REGION_ACTIVE=1
}

zle -N select-to-line-end
bindkey $'\e[1;2F' select-to-line-end

backspace-or-delete-region() {
    if (( REGION_ACTIVE )); then
        zle kill-region
    else
        zle backward-delete-char
    fi
}
zle -N backspace-or-delete-region
bindkey '^?' backspace-or-delete-region
bindkey '^H' backspace-or-delete-region