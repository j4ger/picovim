---@type (string|vim.pack.Spec)[]
local specs = { gh 'windwp/nvim-autopairs' }

vim.pack.add(specs)

require('nvim-autopairs').setup {}
