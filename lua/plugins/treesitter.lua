---@type (string|vim.pack.Spec)[]
local specs = { { src = gh 'romus204/tree-sitter-manager.nvim' } }

vim.pack.add(specs)

require('tree-sitter-manager').setup {
  ensure_installed = {
    'bash',
    'c',
    'diff',
    'html',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'query',
    'vim',
    'vimdoc',
  },
  auto_install = true,
  highlight = true,
}
