set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/dotfiles/vim/bundle/Vundle.vim
set rtp+=~/dotfiles/vim
let path='~/dotfiles/vim/bundle'
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'nono/vim-handlebars'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'

call vundle#end()


"Env Config
"=============================
set encoding=utf-8

syntax on
syntax enable
set number
colorscheme tomorrow-night
set linebreak

set laststatus=2
set lines=40
set columns=140

set guioptions-=T "remove toolbar
set guioptions+=LlRrb
set guioptions-=LlRrb


filetype on
filetype plugin on
filetype plugin indent on 
filetype indent on

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

au FocusLost * :wa
set autowriteall

"Editor Config
""=====================================================

set nowrap

set ttyfast
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent
set autoindent
set cindent

set wildmode=list:longest
set foldenable

set hlsearch
set incsearch
set ignorecase
set smartcase

set showcmd

set backspace=indent,eol,start

set completeopt=longest,menuone

"List chars
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<


"Mappings
"======================================================

nmap <space> :

map ,p "+p 
map ,y "+y

            
set wildmode=list:longest,list:full

nmap ,f :CtrlP<cr>
nmap ,w :w<cr>
nmap ,d :bd<cr>
nmap cc S
nmap <Leader>s :VimShell<cr>
nmap ,n :NERDTreeToggle<cr>

nm mc m`b~``

function! RenameFile()
	let old_name = expand('%')
	let new_name = input('New file name: ', expand('%'), 'file')
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		exec ':silent !rm ' . old_name
		redraw!
	endif
endfunction

map <leader>n :call RenameFile()<cr>

"Misc
"======================================================

autocmd bufwritepost .vimrc source $MYVIMRC

function! MakeSession()
    let sessionFile = $HOME . "/.vim/sessions/vim.session"
    exe "mksession! " . sessionFile
endfunction

function! LoadSession()
    if argc() == 0
        let sessionFile = $HOME . "/.vim/sessions/vim.session"
        if (filereadable(sessionFile))
            exe 'source ' sessionFile
        else
            echo "No session loaded."
        endif
    endif
endfunction

"au VimEnter * nested :call LoadSession()
"au VimLeave * :call MakeSession()
