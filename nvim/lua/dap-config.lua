local dap = require('dap')
local dapui = require('dapui')

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Keymaps
vim.keymap.set('n', '<Space>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<Space>c', dap.continue)
vim.keymap.set('n', '<Space>q', dap.terminate)
vim.keymap.set('n', '<Space>i', dap.step_into)
vim.keymap.set('n', '<Space>o', dap.step_out)
vim.keymap.set('n', '<Space>s', dap.step_over)

-- Adapters
require('dap-python').setup()
