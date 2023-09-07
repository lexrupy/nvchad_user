---@type ChadrcConfig 
local M = {}
M.ui = {
  -- transparency = true,
  theme = "doomchad"
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

require("custom.configs.autocmds")
require("custom.configs.ui")


return M
