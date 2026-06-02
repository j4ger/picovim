vim.pack.add { gh 'nvim-lua/plenary.nvim', gh 'j-morano/buffer_manager.nvim' }

require('buffer_manager').setup {}

vim.keymap.set('n', '<leader>bb', function()
  require('buffer_manager.ui').toggle_quick_menu()
end, { desc = '[B]uffer manager' })
