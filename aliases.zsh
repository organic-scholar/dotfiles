alias install='sudo apt-get install'

alias remove='sudo apt-get purge'

alias autoremove='sudo apt-get autoremove --purge'

alias spackage='sudo apt-cache search'

alias dotfiles='$EDITOR $HOME/bin/dotfiles/'

alias serve='python -m SimpleHTTPServer 3000 && google-chrome locahost:3000'

alias composer="hhvm -v ResourceLimit.SocketDefaultTimeout=30 -v Http.SlowQueryThreshold=30000 $HOME/bin/composer"  

alias servephp='php -S localhost:8000'

alias untar='tar -xvf'

alias open='nautilus'

alias sencha="$HOME/bin/Sencha/Cmd/4.0.4.84/sencha"

mkcd () {
  mkdir "$1"
  cd "$1"
}
gi (){
    sudo npm install --save-dev gulp gulp-util
}
gip (){
    sudo npm install --save-dev gulp-"$1"
}
jslib (){
    gi
    gip "concat"
    gip "uglify"
    touch "gulpfile.js"
    mkdir "dist"
    mkdir "lib"
}

alias gc="git clone"

