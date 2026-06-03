---@type (string|vim.pack.Spec)[]
local specs = { gh 'lukas-reineke/indent-blankline.nvim' }

vim.pack.add(specs)

require('ibl').setup {}
