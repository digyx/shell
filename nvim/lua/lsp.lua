require('fidget').setup({})
require('lsp_signature').setup()

require('mason').setup()
require('mason-lspconfig').setup({
  automatic_installation = true,
})

-- Format on save
vim.api.nvim_create_autocmd(
  'BufWritePre',
  {
    pattern = { '<buffer>' },
    callback = function()
      vim.lsp.buf.format({})
    end,
  }
)


-- Language Servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local language_servers = {
  'gopls',
  'pyright',
  'rust_analyzer',
  'elixirls',
  'html',
  'cssls',
  'tsserver',
  'emmet_ls',
  'sumneko_lua',
}
local settings = {
  Lua = {
    diagnostics = {
      globals = { 'vim' }
    }
  }
}

for _, server in ipairs(language_servers) do
  require('lspconfig')[server].setup({
    capabilities = capabilities,
    settings = settings,
  })
end
