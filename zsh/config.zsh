ZSH_THEME="robbyrussell"
# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
plugins=(git)
# User configuration
export LANG=en_US.UTF-8
export SSH_KEY_PATH="~/.ssh/dsa_id"
if [[ ! $TERM =~ screen ]]; then
    exec tmux -2
fi

bindkey -v
