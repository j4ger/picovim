vim.pack.add { gh 'rmagatti/auto-session' }

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

require('auto-session').setup {
  suppressed_dirs = { '~/', '~/Downloads', '/' },
  bypass_save_filetypes = { 'alpha' },
}
