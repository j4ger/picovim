---@type (string|vim.pack.Spec)[]
local specs = { gh 'goolord/alpha-nvim' }
if vim.g.have_nerd_font then
  table.insert(specs, gh 'nvim-tree/nvim-web-devicons')
end

vim.pack.add(specs)

require('alpha').setup(require('alpha.themes.startify').config)
