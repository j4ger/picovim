---@type (string|vim.pack.Spec)[]
local specs = { gh 'numToStr/Comment.nvim' }

vim.pack.add(specs)

require('Comment').setup {}
