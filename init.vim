call plug#begin('~/local/share/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'windwp/nvim-autopairs'
call plug#end()

"Theme
colorscheme gruvbox

"General Options
set number relativenumber
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set splitright

"Language Servers
set completeopt=menuone,noselect "Autocomplete
let g:compe = {}
let g:compe.source = {}
let g:compe.source.nvim_lsp = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
require'lspconfig'.gopls.setup{}
require'lspconfig'.rust_analyzer.setup{}

require('nvim-autopairs').setup({})
require('nvim-autopairs.completion.compe').setup({
    map_cr = true,
    map_complete = true,
    auto_select = false,
})
EOF
