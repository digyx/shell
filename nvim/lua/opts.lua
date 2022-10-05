vim.cmd [[colorscheme gruvbox]]

vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10

vim.opt.foldenable = false
vim.api.nvim_set_var('tex_flavor', 'latex')

-- Tab Settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
