---@type (string|vim.pack.Spec)[]
local specs = { gh 'max397574/better-escape.nvim' }

vim.pack.add(specs)

require('better_escape').setup {}
