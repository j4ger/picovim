---@type (string|vim.pack.Spec)[]
local specs = { gh 'rmagatti/auto-session' }

vim.pack.add(specs)

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

require('auto-session').setup {
  suppressed_dirs = { '~/', '~/Downloads', '/' },
  bypass_save_filetypes = { 'alpha' },
}
