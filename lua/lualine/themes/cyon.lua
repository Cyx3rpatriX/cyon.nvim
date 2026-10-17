local c = require("cyon.palette").get("grid")

local function mode(color)
  return {
    a = { fg = c.void, bg = color, gui = "bold" },
    b = { fg = color, bg = c.bg_line },
    c = { fg = c.fg_dim, bg = c.bg_float },
  }
end

return {
  normal   = mode(c.blue),
  insert   = mode(c.cyan),
  visual   = mode(c.magenta),
  replace  = mode(c.red),
  command  = mode(c.orange),
  inactive = {
    a = { fg = c.comment, bg = c.bg_float },
    b = { fg = c.comment, bg = c.bg_float },
    c = { fg = c.comment, bg = c.bg_float },
  },
}
