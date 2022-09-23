vim.keymap.set('n', 'gB', ':!tectonic main.tex<CR>')

local function getWords()
  local words = vim.fn.wordcount().words
  return string.format("%d words", words)
end

require('lualine').setup({
  sections = {
    lualine_y = { 'progress', getWords }
  }
})
