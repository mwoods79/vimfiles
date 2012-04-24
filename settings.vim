" General {{{
filetype plugin indent on
set formatprg=par\ -w50
" Where to look for tags
set tags =./tags,./TAGS,tags,TAGS,./tmp/tags,./tmp/TAGS

set splitright
let mapleader = ","
let maplocalleader = "\\"
"
" showmarks
let g:showmarks_enable = 1
hi! link ShowMarksHLl LineNr
hi! link ShowMarksHLu LineNr
hi! link ShowMarksHLo LineNr
hi! link ShowMarksHLm LineNr

" }}}

" Colors {{{
set t_Co=256                   " 256 colors working with OSX Terminal
let g:solarized_termcolors=256 " Use as many as we can
let g:solarized_termtrans=1    " Transparency when we can
set background=dark            " Use Dark instead of Light version
colorscheme solarized          " Solarized is NICE
"colorscheme badwolf
syntax on
" }}}

" Pattern Matching {{{
" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

highlight ExtraWhitespace ctermbg=red guibg=red
highlight LongLine ctermbg=yellow guibg=red

autocmd BufWinEnter * let w:m2=matchadd('LongLine', '\%>120v.\+', -1)
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}}

" Temp Files {{{
set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup

set undofile
set undolevels=1000
set undoreload=10000
" }}}

" Settings {{{
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=longest,menuone,preview
set hidden
set history=1000
set incsearch
set laststatus=2
set cursorline

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set nolist
set showbreak=↪

set notimeout
set ttimeout
set ttimeoutlen=10

set modelines=0
set noeol
set relativenumber
set numberwidth=10
set ruler
set shell=/bin/bash
set showcmd

set matchtime=2

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu
"set nowrap
set wrap

set dictionary=/usr/share/dict/words
" }}}

" White characters {{{
set autoindent
set tabstop=2
set textwidth=80
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set formatoptions=qrn1
set colorcolumn=+1
" }}}

" Triggers {{{

" Save when losing focus
autocmd FocusLost    * :silent! wall

autocmd FocusLost    * :set number
autocmd FocusGained  * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
"
"au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax
autocmd BufRead,BufNewFile *.hamlc set filetype=haml

" Android Development
autocmd BufReadPost,BufNew *.java exe ":compiler ant"
autocmd BufReadPost,BufNew *.xml exe ":compiler ant"

" }}}

" Folding {{{

set foldlevelstart=0

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
set foldmethod=marker
" }}}
