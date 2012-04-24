
nmap <leader>f :CtrlP<cr>
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>m :CtrlPMRU<cr>

let g:ctrlp_lazy_update = 1
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
let g:ctrlp_user_command = {
\ 'types': {
  \ 1: ['.git/', 'cd %s && git ls-files'],
  \ 2: ['.hg/', 'hg --cwd %s locate -I .'],
  \ },
\ 'fallback': 'find %s -type f'
\ }
