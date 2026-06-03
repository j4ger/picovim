_G.gh = function(repo) return 'https://github.com/' .. repo end

-- mod.rs-style auto-loader: loads all sibling *.lua files (excluding this one).
-- To add a new plugin, just drop a .lua file in this directory.

local plugins_dir = vim.fs.joinpath(vim.fn.stdpath('config'), 'lua', 'plugins')
local files = {}
for file_name, type in vim.fs.dir(plugins_dir) do
  if type == 'file' and file_name:match('%.lua$') and file_name ~= 'init.lua' then
    table.insert(files, file_name)
  end
end
table.sort(files)

for _, file_name in ipairs(files) do
  local mod = file_name:gsub('%.lua$', '')
  require('plugins.' .. mod)
end

-- Build hooks for plugins requiring compilation after install/update
local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local output = (result.stderr ~= '' and result.stderr or result.stdout) or ''
    if output == '' then output = 'No output from build command.' end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    if name == 'LuaSnip' then
      if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then
        run_build(name, { 'make', 'install_jsregexp' }, ev.data.path)
      end
      return
    end

  end,
})