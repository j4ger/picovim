-- mod.rs-style auto-loader: loads all sibling *.lua files (excluding this one).
-- To add a new config module, just drop a .lua file in this directory.

local config_dir = vim.fs.joinpath(vim.fn.stdpath('config'), 'lua', 'config')
local files = {}
for file_name, type in vim.fs.dir(config_dir) do
  if type == 'file' and file_name:match('%.lua$') and file_name ~= 'init.lua' then
    table.insert(files, file_name)
  end
end
table.sort(files)

for _, file_name in ipairs(files) do
  local mod = file_name:gsub('%.lua$', '')
  require('config.' .. mod)
end