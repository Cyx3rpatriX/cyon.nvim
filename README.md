# cyon.nvim

<h1 align="center">🔵 cyon.nvim</h1>

<p align="center">
  A Tron Legacy x Cyberpunk colorscheme for Neovim.<br>
  Neon blue <code>#1f51ff</code> on a void-black grid.
</p>

---

## ✨ Features

- Neon blue core with cyan, magenta, orange and purple accents
- 3 variants: `grid` (Tron), `neon` (synthwave), `clu` (orange villain mode)
- Treesitter, LSP and diagnostics support
- Plugin support: Telescope, nvim-cmp, blink.cmp, nvim-tree, neo-tree, gitsigns, indent-blankline, which-key, lazy, mason
- Matching lualine theme
- Transparent background option
- Glowing neon borders
- `on_highlights` hook to override any group

## 🎨 Palette

| Role | Colour | Hex |
|---|---|---|
| Primary / keywords | Neon Blue | `#1f51ff` |
| Functions | Tron Cyan | `#00f0ff` |
| Strings | Cyber Magenta | `#ff2bd6` |
| Numbers / constants | Clu Orange | `#ff6a00` |
| Types | Purple | `#8a2bff` |
| Success | Neon Green | `#39ff14` |
| Errors | Red | `#ff1744` |
| Background | Void | `#070b17` |
| Foreground | Icy White | `#c8d6ff` |

## 📦 Installation

**Requires Neovim 0.9+ with `termguicolors` support (0.10+ recommended).**

### lazy.nvim

```lua
{
  "Cyx3rpatriX/cyon.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyon").setup({
      variant = "grid",
    })
    vim.cmd.colorscheme("cyon")
  end,
}
```

### packer.nvim

```lua
use {
  "Cyx3rpatriX/cyon.nvim",
  config = function()
    require("cyon").setup()
    vim.cmd.colorscheme("cyon")
  end,
}
```

### vim-plug

```vim
Plug 'Cyx3rpatriX/cyon.nvim'
colorscheme cyon
```

## ⚙️ Configuration

Defaults:

```lua
require("cyon").setup({
  variant = "grid",        -- "grid" | "neon" | "clu"
  transparent = false,
  transparency_keymap = "<leader>bg", -- toggle at runtime
  italic_comments = true,
  bold_keywords = true,
  glow_borders = true,
  terminal_colors = true,
  on_highlights = nil,     -- function(hl, c) end
})
```

### Overriding highlights

```lua
require("cyon").setup({
  on_highlights = function(hl, c)
    hl.CursorLine = { bg = c.bg_visual }
    hl.Comment = { fg = c.fg_dim, italic = true }
  end,
})
```
### Transparent background

```lua
require("cyon").setup({
  transparent = true,
  transparency_keymap = "<leader>bg", -- toggle at runtime
})
```
> | transparency_keymap | `nil` | Normal-mode key that toggles transparency, e.g. `"<leader>bg"` |
> Your terminal also needs to be transparent for this to show.

### Variants

| Variant | Vibe |
|---|---|
| `grid` | Pure Tron: blue keywords, cyan functions |
| `neon` | Purple keywords, magenta strings |
| `clu` | Orange keywords, yellow strings |

### Lualine

```lua
require("lualine").setup({
  options = { theme = "cyon" },
})
```

## 🧪 Testing without installing

```bash
nvim --clean \
  --cmd "set rtp+=/path/to/cyon.nvim" \
  -c "colorscheme cyon"
```

## 🤝 Contributing

Issues and PRs are welcome. If a plugin looks off, open an issue with a screenshot and the output of `:Inspect`.

