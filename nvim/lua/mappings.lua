-- General Keymaps
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>fg', telescope.live_grep)
vim.keymap.set('n', '<leader>fh', telescope.help_tags)

-- LSP Keymaps
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>r', ':Lspsaga rename<CR>')
vim.keymap.set('n', '<leader><space>', ':Lspsaga code_action<CR>')
vim.keymap.set('n', 'gf', ':Lspsaga lsp_finder<CR>')
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gp', ':Lspsaga peek_definition<CR>')

vim.keymap.set('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>')
vim.keymap.set('n', ']d', ':Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', '[g', ':Gitsigns prev_hunk<CR>')
vim.keymap.set('n', ']g', ':Gitsigns next_hunk<CR>')
