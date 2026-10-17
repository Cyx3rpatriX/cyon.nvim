-- cyon.nvim palette
local M = {}

local base = {
  void      = "#05070d",
  bg        = "#070b17",
  bg_float  = "#0a0f1f",
  bg_line   = "#0d1530",
  bg_visual = "#12235e",
  bg_search = "#1a2f8a",
  border    = "#1f51ff",
  fg        = "#c8d6ff",
  fg_dim    = "#8fa3d9",
  comment   = "#4a5a8a",
  gutter    = "#2a3a6e",

  blue      = "#1f51ff", -- PRIMARY neon blue
  cyan      = "#00f0ff", -- Tron grid glow
  magenta   = "#ff2bd6", -- cyberpunk contrast
  orange    = "#ff6a00", -- Clu accent
  purple    = "#8a2bff",
  green     = "#39ff14",
  yellow    = "#ffe600",
  red       = "#ff1744",
  ice       = "#7fb2ff",
}

M.variants = {
  grid = {},
  neon = { string = "magenta", keyword = "purple", func = "cyan" },
  clu = { keyword = "orange", string = "yellow", func = "cyan", type = "magenta" },
}

function M.get(variant)
  local c = vim.deepcopy(base)
  local map = vim.tbl_extend("force", {
    keyword = "blue", func = "cyan", string = "magenta",
    type = "purple", number = "orange", const = "orange",
  }, M.variants[variant] or {})
  c.roles = {}
  for role, name in pairs(map) do c.roles[role] = c[name] end
  return c
end

return M
