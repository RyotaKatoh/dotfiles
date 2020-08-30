" Configuration file for vim
set modelines=0		" CVE-2007-2438
set fenc=utf-8		" use UTF-8 for encoding
set nobackup
set noswapfile
set autoread
set hidden
set showcmd

" Configration for visuals
set t_Co=256
colorscheme molokai
set autoindent
set number
set cursorline
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
syntax enable

" Tab
set tabstop=2
set shiftwidth=2

" search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.vim/dein')
  call dein#begin('$HOME/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " My plugins
  call dein#add('scrooloose/nerdtree')
  call dein#add('fatih/vim-go')
	call dein#add('scrooloose/syntastic')
	call dein#add('tell-k/vim-autopep8')
 
	" Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" NERDTree-------------------------
nnoremap <silent><C-e> :NERDTree<CR>

" display nerdtree in default
let g:nerdtree_tabs_open_on_console_startup=1

" if all tabs are closed, NERDTree is also closed.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"End NERDTree-------------------------

" Syntastic
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

" Autopep8
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
