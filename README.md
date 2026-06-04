# Neovim Config

Modular Neovim configuration built on `vim.pack`.

## Install

```sh
git clone https://github.com/j4ger/picovim.git ~/.config/nvim
nvim
```

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
│   │   ├── init.lua          # gh() helper, build hooks, auto-loads *.lua in this dir
│   │   └── ...               # other plugins
│   └── custom/plugins/       # your own plugins
│       └── init.lua          # auto-loads *.lua in this dir
```

## Requirements

- Neovim >= 0.11
- `git`, `make`, `gcc`, `ripgrep`, `fd`, `tree-sitter`
- A [Nerd Font](https://www.nerdfonts.com) (optional, set `have_nerd_font` in `lua/config/options.lua`)
