local M = {}

M.config = {
  variant = "grid",          -- "grid" | "neon" | "clu"
  transparent = false,
  italic_comments = true,
  bold_keywords = true,
  glow_borders = true,       -- bright blue window borders
  terminal_colors = true,
  on_highlights = nil,       -- function(hl, c) end
  transparency_keymap = nil,  -- e.g. "<leader>bg"
}

-- Toggle transparency, or set it explicitly: bg_transparent(true/false)     ....
function M.bg_transparent(value)
  if value == nil then
    M.config.transparent = not M.config.transparent
  else
    M.config.transparent = value
  end
  vim.cmd.colorscheme("cyon")
  vim.notify(
    "cyon: transparent background " .. (M.config.transparent and "ON" or "OFF"),
    vim.log.levels.INFO
  )
end

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})

  if M.config.transparency_keymap then
    vim.keymap.set("n", M.config.transparency_keymap, function()
      M.bg_transparent()
    end, {
      noremap = true,
      silent = true,
      desc = "Cyon: toggle transparent background",
    })
  end
end

function M.load()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "cyon"

  local c = require("cyon.palette").get(M.config.variant)
  local hl = require("cyon.theme").build(c, M.config)

  if M.config.on_highlights then M.config.on_highlights(hl, c) end
  for group, spec in pairs(hl) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  if M.config.terminal_colors then
    local t = {
      c.void, c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.fg,
      c.comment, c.red, c.green, c.yellow, c.ice, c.magenta, c.cyan, "#ffffff",
    }
    for i, col in ipairs(t) do vim.g["terminal_color_" .. (i - 1)] = col end
  end
end

return M
