local M = {}

M.config = {
  variant = "grid",          -- "grid" | "neon" | "clu"
  transparent = false,
  italic_comments = true,
  bold_keywords = true,
  glow_borders = true,       -- bright blue window borders
  terminal_colors = true,
  on_highlights = nil,       -- function(hl, c) end
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
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
