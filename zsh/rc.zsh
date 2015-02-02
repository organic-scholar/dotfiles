export ZSH=$HOME/dotfiles/zsh/.oh-my-zsh
source $HOME/dotfiles/zsh/config.zsh
source $HOME/dotfiles/zsh/paths.zsh
source $HOME/dotfiles/zsh/aliases.zsh
source $HOME/dotfiles/zsh/includes.zsh
source $ZSH/oh-my-zsh.sh

echo -ne '\e]4;0;#000000\a'   # black
echo -ne '\e]4;1;#BF0000\a'   # red
echo -ne '\e]4;2;#00BF00\a'   # green
echo -ne '\e]4;3;#BFBF00\a'   # yellow
echo -ne '\e]4;4;#0000BF\a'   # blue
echo -ne '\e]4;5;#BF00BF\a'   # magenta
echo -ne '\e]4;6;#00BFBF\a'   # cyan
echo -ne '\e]4;7;#BFBFBF\a'   # white (light grey really)
echo -ne '\e]4;8;#404040\a'   # bold black (i.e. dark grey)
echo -ne '\e]4;9;#FF4040\a'   # bold red
echo -ne '\e]4;10;#40FF40\a'  # bold green
echo -ne '\e]4;11;#FFFF40\a'  # bold yellow
echo -ne '\e]4;12;#6060FF\a'  # bold blue
echo -ne '\e]4;13;#FF40FF\a'  # bold magenta
echo -ne '\e]4;14;#40FFFF\a'  # bold cyan
echo -ne '\e]4;15;#FFFFFF\a'  # bold white
