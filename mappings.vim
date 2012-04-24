com! W :w

" sane regexes
nnoremap / /\v
vnoremap / /\v

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C->l
nnoremap <leader>d <C-w>s<C-w>j

" vertical window split
noremap <leader>v <C-w>v

" horizontal window split
noremap <leader>s <C-w>s

" Space to toggle folds.
nnoremap <Enter> za
vnoremap <Enter> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

"Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

nnoremap <leader>ev <C-w>s<C-w>j:e $MYVIMRC<cr>
nnoremap <leader>es <C-w>s<C-w>j:e ~/.vim/snippets/<cr>
nnoremap <leader>eg <C-w>s<C-w>j:e ~/.gitconfig<cr>
nnoremap <leader>ez <C-w>s<C-w>j:e ~/.zshrc<cr>
nnoremap <leader>et <C-w>s<C-w>j:e ~/.tmux.conf<cr>

map ,i :set list!<CR> " Toggle invisible chars

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" format the entire file
nmap <leader>fef ggVG=

