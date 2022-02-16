call plug#begin('~/.local/share/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"Theme
colorscheme gruvbox

"General Options
set number relativenumber
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set splitright
set scrolloff=10

tnoremap <Esc> <C-\><C-n>
command TMK w | call system("latexmk -pdf && latexmk -c")

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" coc.nvim Plugins
let g:coc_global_extensions = [
    \'coc-pairs',
    \'coc-json',
    \'coc-git',
    \'coc-pyright',
    \'coc-go',
    \'coc-rust-analyzer',
    \'coc-clangd',
    \'coc-html',
    \'coc-css',
    \'coc-tsserver',
    \'coc-flutter'
\]

" GoTo code navigation.
nmap <leader>def <Plug>(coc-definition)
nmap <leader>typedef <Plug>(coc-type-definition)
nmap <leader>impl <Plug>(coc-implementation)
nmap <leader>ref <Plug>(coc-references)

" Misc coc-commands
nmap <leader>rename <Plug>(coc-rename)
nmap <leader>help :CocDiagnostics<CR>
nmap <leader>git <Plug>(coc-git-commit)

" Language Specific Settings
function! Golang_settings()
    setlocal tabstop=4
    setlocal noexpandtab
endfunction

autocmd FileType go call Golang_settings()
