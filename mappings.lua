local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" }
  }
}


M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    }
  }
}


M.abc = {
  n = {
    ["ç"] = {":"},
    ["Ç"] = {":"},
    ["<c-d>"] = {"<c-d>zz", "Move Half Page DOWN"},
    ["<c-u>"] = {"<c-u>zz", "Move Half Page UP"},
    ["<leader>e"] = {"<cmd> NvimTreeToggle <CR>", "Toggle NvimTree"},
  }
}

return M
