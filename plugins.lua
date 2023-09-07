local plugins = {
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()

      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()

      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python" },
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "flake8",
        "pyright",
        "debugpy",
        -- "mypy",
        -- "ruff",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  -- {
  --   "folke/which-key.nvim",
  --   config = function()
  --     local present, wk = pcall(require, "which-key")
  --     if not present then
  --       return
  --     end
  --     wk.register(
  --       {
  --         -- add group
  --         ["<leader>"] = {
  --           f = { name = "+file" },
  --           c = { name = "+code" },
  --           g = { name = "+git" },
  --           l = { name = "+LSP" },
  --           -- m = { name = "+tools" },
  --           -- r = { name = "+git" },
  --           -- t = { name = "+git" }, 
  --           -- w = { name = "+git" },
  --         }
  --       }
  --     )
  --   end,
  -- },
  {
    "Wansmer/treesj",
    keys = {
      {
        "<leader>m",
        "<CMD>TSJToggle<CR>",
        desc = "Toggle Treesitter Join",
      },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false }
  },
}
return plugins
