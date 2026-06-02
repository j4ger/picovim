vim.loader.enable()

require('config.options')
require('config.keymaps')
require('config.autocmds')

require('plugins.init')

require('plugins.ui')
require('plugins.telescope')
require('plugins.lsp')
require('plugins.formatting')
require('plugins.completion')
require('plugins.treesitter')

require('plugins.gitsigns')
require('plugins.indent_line')
require('plugins.lint')
require('plugins.autopairs')
require('plugins.yazi')

require('custom.plugins')

if vim.g.neovide then
  vim.o.guifont = 'Maple Mono NF CN Light:h14'
end