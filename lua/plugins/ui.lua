---@type (string|vim.pack.Spec)[]
local specs = {
  gh 'NMAC427/guess-indent.nvim',
  gh 'folke/which-key.nvim',
  gh 'scottmckendry/cyberdream.nvim',
  gh 'folke/todo-comments.nvim',
  gh 'nvim-mini/mini.nvim',
}
if vim.g.have_nerd_font then
  table.insert(specs, gh 'nvim-tree/nvim-web-devicons')
end

vim.pack.add(specs)

require('guess-indent').setup {}

require('which-key').setup {
  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },
  spec = {
    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
}

require('cyberdream').setup {}
vim.cmd.colorscheme 'cyberdream'

require('todo-comments').setup { signs = false }

require('mini.ai').setup {
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}

require('mini.surround').setup()

local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }
