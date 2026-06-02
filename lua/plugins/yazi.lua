-- Integrate yazi for file tree navigation

local plugins = {
  'https://github.com/mikavilpas/yazi.nvim'
}

vim.pack.add(plugins)

vim.keymap.set('n', '<leader>e', '<cmd>Yazi toggle<CR>', { desc = 'Toggle Yazi' })
vim.keymap.set('n', '<leader>E', '<cmd>Yazi cwd<CR>', { desc = 'Open Yazi in CWD' })

require("yazi").setup({
  open_for_directories = true,
})
