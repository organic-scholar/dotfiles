function fdev(){
	devDir=$PWD
	tmux new-window -n 'vim' "vim -c 'cd $devDir'"
    tmux new-window -n 'server' "http-server -p 3000 `cygpath -m -w $devDir`"
    tmux select-window -t 'vim'
}
function ndev(){

}
