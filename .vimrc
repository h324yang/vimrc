"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default UTF-8 encoding
set encoding=utf-8

" Let Vim compatiable with 256 colors
set t_Co=256

" Cursorline and current line setting
set cursorline
hi CursorLineNr cterm=bold ctermfg=255 ctermbg=None
hi CursorLine cterm=None ctermbg=238 ctermfg=None 

" Set background and highlight
set bg=dark
hi Comment ctermfg=27

" Sets how many lines of history VIM has to remember
set history=50

" Enable filetype plugins
filetype plugin on
filetype indent on

" automatically reload vimrc when it's saved
autocmd BufWritePost .vimrc source ~/.vimrc

" Enable syntax highlighting
syntax enable 
set nu
hi LineNr cterm=bold ctermfg=238 ctermbg=NONE

" Set 8 lines to the cursor - when moving up and down
set so=8

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Always show the status line
set laststatus=2

" Add a bit extra margin to the left
set foldcolumn=1

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()

" Set <F10> for toggling paste model
set pastetoggle=<F10>

" Show the result of search
set hlsearch

" Set to close the highlight of search result
nnoremap <leader><leader> :nohlsearch<CR>

" Set to toggle line number
nnoremap <F3> :set invnumber<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab and Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" Use spaces instead of tabs
set expandtab

" Set textwidth
set textwidth=80

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
"set softtabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai
" Smart indent
set si
" Wrap lines
set wrap

" Disable autocomment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" show matched braces
set showmatch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" NerdTree
Bundle 'The-NERD-tree'
let NERDTreeWinPos='right'
let NERDTreeWinSize=60
nnoremap <F2> :NERDTreeToggle<CR>

" Multiple-cursor
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Jedi-vim
Bundle 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot=0
set completeopt-=preview
let g:pymode_folding=0
let g:jedi#show_call_signatures_delay=500

" Airline
Bundle 'vim-airline'
let g:airline_powerline_fonts = 0
let g:airline_theme = 'luna'
let g:airline#extensions#whitespace#enabled = 0

