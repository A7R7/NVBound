NVBound is my personal neovim configuration. Its config structure derives from LazyVim.

## 📂 File Structure

<pre>
.
├── init.lua # The entry of configs
├── lua
│   ├── core
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua      # configs for lazy.nvim
│   │   ├── neovide.lua   # configs for neovide, a cool neovim gui
│   │   └── options.lua
│   ├── plugins           # plugins loaded by lazy.nvim
│   │   ├── coding.lua
│   │   ├── colorscheme.lua
│   │   ├── editor.lua
│   │   ├── explorer.lua
│   │   ├── lang.lua
│   │   ├── lsp
│   │   │   ├── format.lua
│   │   │   ├── init.lua
│   │   │   └── keymaps.lua
│   │   ├── treesitter.lua
│   │   ├── ui.lua
│   │   └── util.lua
│   ├── _tex.lua
│   ├── util
│   │   ├── alpha_bak.lua
│   │   ├── alpha.lua     # ascii drawings for alpha dashboard
│   │   ├── icons.lua
│   │   ├── init.lua
│   │   └── lunar_icons.lua # icons proudly stolen from lunarvim, not used yet
│   └── _utils.lua
├── luasnip                # luasnip snippets for fast editing
│   ├── all.lua
│   ├── lua
│   ├── tex
│   │   ├── denote.lua
│   │   ├── env.lua
│   │   ├── font.lua
│   │   ├── geek.lua
│   │   ├── math.lua
│   │   ├── operator.lua
│   │   ├── range.lua
│   │   ├── surround.lua
│   │   ├── temp.lua
│   │   ├── _tex.lua
│   │   └── updown.lua
│   └── _utils.lua
├── plugins -> ~/.local/share/nvim/ # for quick access to plugins
├── readme.md
└── syntax
    └── asm.vim           # syntax highlighting for asm
</pre>
