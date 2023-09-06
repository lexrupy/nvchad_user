local autocmd = vim.api.nvim_create_autocmd

-- autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     vim.t.bufs = vim.tbl_filter(function(bufnr)
--       return vim.api.nvim_buf_get_option(bufnr, "modified")
--     end, vim.t.bufs)
--   end,
-- })

-- Set Caps Off when exit inser mode 
-- TEST CAPS ENABLED
autocmd("InsertLeave", {
  callback = function()
    local _, _, caps_state = vim.fn.system("xset -q"):find("00: Caps Lock:%s+(%a+)")
    if caps_state == "on" then
      vim.fn.system("xdotool key Caps_Lock")
    end
  end,
})

