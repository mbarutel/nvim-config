return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
      },
    },
    autotag = {
      enable = true,
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "vue", "tsx", "jsx", "xml" },
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      search = {
        min_pattern_length = 2,
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>zx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>zX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>zs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>zl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>zL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>zQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
  },
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    opts = { backends = { "lsp", "treesitter" } },
    config = function(_, opts)
      require("aerial").setup(opts)
      vim.keymap.set("n", "<M-Down>", require("aerial").next, { desc = "Next symbol" })
      vim.keymap.set("n", "<M-Up>", require("aerial").prev, { desc = "Prev symbol" })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- Function to set DAP highlights
      local function set_dap_highlights()
        vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51400" })
        vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })
        vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })
        vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2e3440" })
      end

      -- Set highlights now
      set_dap_highlights()

      -- Re-apply highlights after colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_dap_highlights,
      })

      -- Customize DAP signs (icons and colors)
      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "DapBreakpoint",
      })
      vim.fn.sign_define("DapBreakpointCondition", {
        text = "◆",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "DapBreakpoint",
      })
      vim.fn.sign_define("DapBreakpointRejected", {
        text = "○",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "DapBreakpoint",
      })
      vim.fn.sign_define("DapLogPoint", {
        text = "◉",
        texthl = "DapLogPoint",
        linehl = "",
        numhl = "DapLogPoint",
      })
      vim.fn.sign_define("DapStopped", {
        text = "→",
        texthl = "DapStopped",
        linehl = "DapStoppedLine",
        numhl = "DapStopped",
      })
    end,
  },

  -- DAP UI for a better debugging experience
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dapui.setup()

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Go-specific DAP configuration
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-go").setup()
    end,
  },
  -- {
  --   "greggh/claude-code.nvim",
  --   keys = {
  --     {
  --       "<leader>cc",
  --       function()
  --         require("claude-code").toggle()
  --       end,
  --       desc = "Toggle Claude Code",
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- Required for git operations
  --   },
  --   config = function()
  --     require("claude-code").setup({
  --       window = {
  --         position = "float",
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "ThePrimeagen/harpoon",
  --   branch = "harpoon2",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     local harpoon = require("harpoon")
  --
  --     harpoon:setup()
  --
  --     vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
  --     vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
  --
  --     vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
  --     vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
  --     vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
  --     vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
  --   end,
  -- }
}
