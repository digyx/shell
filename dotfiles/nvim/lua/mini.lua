require('mini.comment').setup()
require('mini.indentscope').setup({
  draw = {
    delay = 0,
    animation = require('mini.indentscope').gen_animation('none')
  }
})
require('mini.pairs').setup()
require('mini.sessions').setup()
require('mini.starter').setup()
require('mini.surround').setup()
require('mini.tabline').setup()
require('mini.trailspace').setup()
