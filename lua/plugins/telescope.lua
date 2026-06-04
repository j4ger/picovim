---@type (string|vim.pack.Spec)[]
local specs = {
  gh 'nvim-lua/plenary.nvim',
  gh 'nvim-telescope/telescope.nvim',
  gh 'nvim-telescope/telescope-ui-select.nvim',
}
if vim.fn.executable 'make' == 1 then
  table.insert(specs, gh 'nvim-telescope/telescope-fzf-native.nvim')
end

vim.pack.add(specs)

require('telescope').setup {
  extensions = {
    ['ui-select'] = { require('telescope.themes').get_dropdown() },
  },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search files' })
vim.keymap.set({ 'n', 'v' }, '<leader>sw', builtin.grep_string, { desc = 'Grep current word' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search diag' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Search buffers' })

-- Buffer-local fuzzy find
vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Search in current buffer' })

-- Grep in open files
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in open files',
  }
end, { desc = 'Live Grep in open files' })

-- Telescope-based LSP pickers
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
  callback = function(event)
    local buf = event.buf
    vim.keymap.set('n', 'gr', builtin.lsp_references, { buffer = buf, desc = 'Goto references' })
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, { buffer = buf, desc = 'Goto implementation' })
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { buffer = buf, desc = 'Goto definition' })
    vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open document symbols' })
    vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, { buffer = buf, desc = 'Goto type definition' })
  end,
})
