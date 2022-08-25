require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  use 'nvim-lualine/lualine.nvim'
  use 'morhetz/gruvbox'
  use 'vim-test/vim-test'
  use 'lewis6991/gitsigns.nvim'
  use 'windwp/nvim-autopairs'

  use 'numToStr/Comment.nvim'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'

  -- nvim-cmp plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons'
    }
  }

  use {
    "nvim-neorg/neorg",
    requires = "nvim-lua/plenary.nvim"
  }

  use "folke/zen-mode.nvim"
end)

-- Caddyfile Grammar
vim.filetype.add({
  filename = {
    ['Caddyfile'] = 'caddyfile',
  }
})

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true
  }
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.caddyfile = {
  install_info = {
    url = '~/Code/tree-sitter-caddyfile',
    files = { 'src/parser.c' },
    branch = 'main',
  },
  filetype = 'caddyfile',
}

-- Automatic LSP Setup
local lspconf = {
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  }
}

local lspconfig = require('lspconfig')
require('mason').setup()
require('mason-lspconfig').setup_handlers({
  function(server_name)
    local opts = lspconf[server_name]
    if opts == nil then
      opts = {}
    end

    lspconfig[server_name].setup(opts)
  end
})

-- Format on save
local function format_on_save()
  vim.lsp.buf.formatting_sync()
end

vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = { "<buffer>" },
    callback = format_on_save,
  }
)

-- Autocomplete Setup
local cmp = require('cmp')
cmp.setup {
  mapping = {
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ["<Up>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,

    ["<Down>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
  },

  sources = {
    { name = "neorg" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
}

-- Misc Plugin Setup
require('lualine').setup()
require('nvim-autopairs').setup()
require('gitsigns').setup()
require('Comment').setup()
require('zen-mode').setup()
require('neorg').setup({
  load = {
    ["core.defaults"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      }
    },
    ["core.integrations.nvim-cmp"] = {},
    ["core.presenter"] = {
      config = {
        zen_mode = "zen-mode"
      }
    },
  }
})

-- General Options
vim.cmd [[colorscheme gruvbox]]

vim.o.number = true
vim.o.relativenumber = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 10

-- Tab Settings
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smarttab = true

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = {
      "html",
      "css",
      "javascript",
      "typescript",
      "vue",
      "lua",
    },
    command = "setlocal shiftwidth=2",
  }
)

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = {
      "go",
    },
    command = "setlocal noexpandtab"
  }
)

-- General Keymaps
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>t', ':TestNearest<CR>')
vim.keymap.set('n', '<leader>T', ':TestFile<CR>')

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>fg', telescope.live_grep)
vim.keymap.set('n', '<leader>fh', telescope.help_tags)

-- LSP Keymaps
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader><space>', vim.lsp.buf.code_action)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
