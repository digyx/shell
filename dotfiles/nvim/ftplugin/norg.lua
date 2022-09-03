require('zen-mode').setup()
require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      }
    },
    ['core.integrations.nvim-cmp'] = {},
    ['core.norg.concealer'] = {},
    ['core.export'] = {},
    ['core.presenter'] = {
      config = {
        zen_mode = 'zen-mode'
      }
    },
  }
})
