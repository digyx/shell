set nocompatible

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mattn/emmet-vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdtree'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

"Theme
colorscheme gruvbox

"General Options
set number relativenumber
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set splitright splitbelow
set scrolloff=10

tnoremap <Esc> <C-\><C-n>
nmap <C-f> :NERDTree<CR>
let NERDTreeQuitOnOpen=3

command TMK w | call system("latexmk -pdf " . expand("%")) | call system("latexmk -c")
command Shh set nonu norelativenumber scl=no
command NoShh set nu relativenumber scl=auto

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
nmap gd <Plug>(coc-definition)
nmap gt <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Diagnostic navigation
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Misc coc-commands
nmap <leader>r <Plug>(coc-rename)
nmap <leader>R <Plug>(coc-refactor)
nmap <leader>h :call CocActionAsync('doHover')<CR>

command Imports call CocActionAsync('organizeImport')
command GitDiff call CocActionAsync('runCommand', 'git.chunkInfo')
command GitUndo call CocActionAsync('runCommand', 'git.chunkUndo')
command GitShow call CocActionAsync('runCommand', 'git.showCommit')

" Language Specific Settings
autocmd FileType go call Golang_settings()
function! Golang_settings()
    setlocal tabstop=4
    setlocal noexpandtab
endfunction

" Terraform Format on Save
autocmd BufWritePost *.tf call TerraformFormat()
function TerraformFormat()
    call system("terraform fmt " . expand("%"))"
    edit
endfunction

