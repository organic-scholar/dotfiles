# aliases

alias vim=nvim
alias k=kubectl
alias resrc="source $HOME/.zshrc"
alias serve='http-server && google-chrome locahost:3000'
alias servephp='php -S localhost:8000'
alias untar='tar -xvf'
alias gamend='git add . && git commit --amend --no-edit && git push origin --force-with-lease'
alias tf='terraform'
alias ls='eza -al --color=always --group-directories-first'

mkcd() {
  mkdir "$1"
  cd "$1"
}
