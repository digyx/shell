require('mason').setup()
require('mason-lspconfig').setup({
  automatic_installation = true,
})

-- Format on save
local function format_on_save()
  vim.lsp.buf.formatting_sync()
end

vim.api.nvim_create_autocmd(
  'BufWritePre',
  {
    pattern = { '<buffer>' },
    callback = format_on_save,
  }
)

-- Language Servers
require('lspconfig')['gopls'].setup({})
require('lspconfig')['pyright'].setup({})
require('lspconfig')['rust_analyzer'].setup({})

require('lspconfig')['html'].setup({})
require('lspconfig')['cssls'].setup({})
require('lspconfig')['tsserver'].setup({})

require('lspconfig')['sumneko_lua'].setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})
