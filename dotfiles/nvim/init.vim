call plug#begin('~/.local/share/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mattn/emmet-vim'
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
command SHH set nonu norelativenumber scl=no
command NOSHH set nu relativenumber scl=auto

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
    \'coc-flutter',
    \'coc-sumneko-lua'
\]

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" Misc coc-commands
nmap <leader>r <Plug>(coc-rename)
nmap <leader>R <Plug>(coc-refactor)
nmap <leader>h call CocActionAsync('definitionHover')

command Imports call CocActionAsync('organizeImport')
command GitDiff call CocActionAsync('runCommand', 'git.chunkInfo')
command GitUndo call CocActionASync('runCommand', 'git.chunkUndo')
command GitShow call CocActionAsync('runCommand', 'git.showCommit')

" Language Specific Settings
function! Golang_settings()
    setlocal tabstop=4
    setlocal noexpandtab
endfunction

autocmd FileType go call Golang_settings()
