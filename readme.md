<h1 align="center"> NVBound </h1>

<hr>

<div align="center"><p>
  <a href="https://github.com/A7R7/NVBound/pulse">
    <img alt="Last commit" src="https://img.shields.io/github/last-commit/A7R7/NVBound?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"/>
  </a>
  <a href="https://github.com/A7R7/NVBound/issues">
      <img src="https://img.shields.io/github/issues/A7R7/NVBound?color=fab387&labelColor=303446&style=for-the-badge">
  </a>
  <a href="https://github.com/A7R7/NVBound/stargazers">
      <img src="https://img.shields.io/github/stars/A7R7/NVBound?color=ca9ee6&labelColor=303446&style=for-the-badge">
  </a>
  <a href="https://github.com/A7R7/NVBound">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/A7R7/NVBound?color=ea999c&labelColor=303446&style=for-the-badge">
  </a>
  <a href="https://github.com/A7R7/NVBound/blob/main/LICENSE">
      <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=ca9ee6&colorA=313244&colorB=cba6f7"/>
  </a>
</div>

NVBound is my personal neovim configuration. 
Its name is inspired by [Starbound](https://playstarbound.com). 
Its config structure derives from [LazyVim](https://github.com/LazyVim/LazyVim).

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
