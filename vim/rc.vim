"Vundle Config
"=====================================================
set nocompatible
set rtp+=~/bin/dotfiles/vim/
execute pathogen#infect('plugins/{}')

"Powerline Config
"====================================================

let g:Powerline_symbols = 'fancy'

"Environment Config
"=====================================================
au ColorScheme * highlight Pmenu guibg=brown gui=bold

set encoding=utf-8

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline

let g:neocomplete#enable_at_startup = 1
let g:vimshell_prompt =  '$ '

syntax on
syntax enable
set number
colorscheme desert
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

au FocusLost * :wa
set autowriteall


"Editor Config
"=====================================================

set nowrap

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



"Mappings
"======================================================
nmap <space> :

map ,p "+p 
map ,y "+y

            
set wildmode=list:longest,list:full

"nmap rc :
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
if has("autocmd")
	autocmd bufwritepost rc.vim source $MYVIMRC
endif

" Creates a session
function! MakeSession()
  let sessionFile = $HOME . "/bin/dotfiles/vim/sessions/myvim.session"
  exe "mksession! " . sessionFile
endfunction


function! LoadSession()
  if argc() == 0
    let sessionFile = $HOME . "/bin/dotfiles/vim/sessions/myvim.session"
    if (filereadable(sessionFile))
      exe 'source ' sessionFile
    else
      echo "No session loaded."
    endif
  endif
endfunction

au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()

