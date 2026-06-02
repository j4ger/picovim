# Neovim Config

Modular Neovim configuration built on `vim.pack`.

## Install

```sh
git clone https://github.com/<your-username>/nvim-config.git ~/.config/nvim
nvim
```

`vim.pack` will install all plugins on first start.

## Structure

```
~/.config/nvim/
├── init.lua                  # bootstrap: require all modules
├── lua/
│   ├── config/
│   │   ├── options.lua       # vim.o settings, diagnostics
│   │   ├── keymaps.lua       # global keymaps
│   │   └── autocmds.lua      # yank highlight
│   ├── plugins/
│   │   ├── init.lua          # gh() helper, build hooks
│   │   ├── ui.lua            # colorscheme, which-key, mini, todo, guess-indent
│   │   ├── telescope.lua     # telescope + fzf + keymaps
│   │   ├── lsp.lua           # fidget, mason, lsp servers
│   │   ├── formatting.lua    # conform.nvim
│   │   ├── completion.lua    # blink.cmp + luasnip
│   │   ├── treesitter.lua    # nvim-treesitter
│   │   ├── gitsigns.lua      # git signs + hunk keymaps
│   │   ├── autopairs.lua
│   │   ├── indent_line.lua
│   │   ├── lint.lua
│   │   └── yazi.lua          # file tree
│   └── custom/plugins/       # your own plugins
│       └── init.lua          # auto-loads *.lua in this dir
```

## Manage plugins

```vim
:lua vim.pack.update(nil, { offline = true })  " inspect state
:lua vim.pack.update()                          " fetch updates
```

## Requirements

- Neovim >= 0.11
- `git`, `make`, `gcc`, `ripgrep`, `fd`, `tree-sitter`
- A [Nerd Font](https://www.nerdfonts.com) (optional, set `have_nerd_font` in `lua/config/options.lua`)