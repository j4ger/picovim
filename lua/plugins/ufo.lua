---@type (string|vim.pack.Spec)[]
local specs = { gh 'kevinhwang91/promise-async', gh 'kevinhwang91/nvim-ufo' }

vim.pack.add(specs)

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

require('ufo').setup {
  provider_selector = function()
    return { 'treesitter', 'indent' }
  end,
}

vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
