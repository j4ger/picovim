---@type (string|vim.pack.Spec)[]
local specs = { gh 'mikavilpas/yazi.nvim' }

vim.pack.add(specs)

vim.keymap.set('n', '<leader>e', '<cmd>Yazi toggle<CR>', { desc = 'Toggle Yazi' })
vim.keymap.set('n', '<leader>E', '<cmd>Yazi cwd<CR>', { desc = 'Open Yazi in CWD' })

require('yazi').setup {
  open_for_directories = true,
  keymaps = {
    show_help = '<f1>',
    open_file_in_vertical_split = '<c-v>',
    open_file_in_horizontal_split = '<c-x>',
    open_file_in_tab = '<c-t>',
    grep_in_directory = '<c-s>',
    replace_in_directory = '<c-g>',
    cycle_open_buffers = '<tab>',
    copy_relative_path_to_selected_files = '<c-y>',
    send_to_quickfix_list = '<c-q>',
    change_working_directory = '<c-enter>',
    open_and_pick_window = '<c-o>',
  },
}
