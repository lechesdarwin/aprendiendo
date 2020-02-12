set number

set relativenumber

packloadall 

set tabstop=4

silent! helptags ALL

command! Bd :bp | :sp | :bn | :bd " Close buffer without closing window.

set foldmethod=manual " los metodos de plegado podemos verlo en la pag 82 de mastering vim

" set clipboard=unnamed,unnamedplus " el registro + es como ctrl+c y el reistro * es como ctrl+v

" Manage plugins with vim-plug.
call plug#begin()
let g:plug_timeout = 300 " Increase vim-plug timeout for YouCompleteMe.
Plug 'sjl/gundo.vim'
" Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py' }
Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
" Plug 'easymotion/vim-easymotion'
call plug#end()
set listchars=tab:····\ ,eol:¶,space:·,trail:•
" →
set list
hi CursorLine term=bold cterm=bold guibg=Grey40   "un bonito color de resaltado  en la linea
" set colorcolumn
" hi CursorLine ctermbg=8  " una liena de resaltado gris
hi CursorLine term=bold cterm=bold guibg=Grey40   "un bonito color de resaltado  en la linea
set cursorcolumn
set cursorline

set tags=tags;
autocmd BufWritePost *.cpp *.h *.py *.go *.js *.jsx *.ts *.html silent! !ctags -R & 
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

noremap <f5> :GundoToggle<cr> " Map Gundo to <F5>.
" nmap ne :NERDTree
