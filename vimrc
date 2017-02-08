" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
set tabstop=4
set autoindent
set number

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/RyotaKatoh/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/RyotaKatoh/.vim/bundles')
  call dein#begin('/Users/RyotaKatoh/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/RyotaKatoh/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " My plugins
  call dein#add('scrooloose/nerdtree')
  call dein#add('fatih/vim-go')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" NERDTree-------------------------
nnoremap <silent><C-e> :NERDTreeFocusToggle<CR>

" display nerdtree in default
let g:nerdtree_tabs_open_on_console_startup=1

" if all tabs are closed, NERDTree is also closed.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"End NERDTree-------------------------
