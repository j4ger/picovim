---@type (string|vim.pack.Spec)[]
local specs = { gh 'folke/flash.nvim' }

vim.pack.add(specs)

require('flash').setup {}

vim.keymap.set({ 'n', 'x', 'o' }, 'f', function()
  require('flash').jump()
end, { desc = 'Flash jump' })
vim.keymap.set({ 'n', 'x', 'o' }, 'F', function()
  require('flash').treesitter()
end, { desc = 'Flash Treesitter' })
