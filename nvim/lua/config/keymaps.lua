-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

vim.keymap.set("n", "<leader>ot", "<leader>ft", { remap = true })

-- which-key
require("which-key").register({
  ["<leader>p"] = { name = "projects" },
})

-- telescope
map("n", "<leader>pp", require("telescope").extensions.projects.projects, "Switch projects")
map("n", "<leader>sp", require("telescope.builtin").live_grep, "Search project")

-- Neogit
local neogit = require("neogit")
map("n", "<leader>gg", neogit.open, "Neogit")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gc")
vim.keymap.del("n", "<leader>gs")

-- Gitsigns
local gs = require("gitsigns")
map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
map("n", "<leader>gb", function()
  gs.blame_line({ full = true })
end, "Blame Line")
map("n", "<leader>gd", gs.diffthis, "Diff This")
map("n", "<leader>gD", function()
  gs.diffthis("~")
end, "Diff This ~")
