require "nvchad.mappings"

local map = vim.keymap.set

-- ============================================================================
-- General Mappings
-- ============================================================================

map("n", ";", ":", { desc = "CMD enter command mode" })
map("x", "P", '"_dP', { desc = "Paste without yanking" })
map("n", "<leader>r", ":bufdo e<CR>", { desc = "Reload all buffers" })
map("n", "<leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

-- ============================================================================
-- Window Management
-- ============================================================================

-- Split windows
map("n", "|", "<cmd>vsplit<CR>", { desc = "Split vertically" })
map("n", "\\", "<cmd>split<CR>", { desc = "Split horizontally" })
map("n", "<leader>q", "<cmd>close<CR>", { desc = "Close pane" })

-- Toggle maximize window
map("n", "<leader>m", function()
  if vim.t.maximized then
    vim.cmd "wincmd ="
    vim.t.maximized = false
  else
    vim.cmd "wincmd |"
    vim.cmd "wincmd _"
    vim.t.maximized = true
  end
end, { desc = "Toggle maximize pane" })

-- ============================================================================
-- Navigation & Scrolling
-- ============================================================================

map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
map("n", "<C-down>", "<C-e>", { desc = "Scroll down" })
map("n", "<C-up>", "<C-y>", { desc = "Scroll up" })

-- ============================================================================
-- LSP & Diagnostics
-- ============================================================================

map("n", "<leader>ld", function()
  vim.diagnostic.open_float(nil, { scope = "line" })
end, { desc = "Show line diagnostics" })

map("n", "<F7>", function()
  require("telescope.builtin").lsp_references({ jump_type = "never" })
end, { desc = "LSP: Find references" })

-- ============================================================================
-- Telescope
-- ============================================================================

map("n", "<C-t>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<C-f>", "<cmd>Telescope live_grep<CR>", { desc = "Find words" })

-- ============================================================================
-- Git
-- ============================================================================

map("n", "<C-g>", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- ============================================================================
-- Aerial (Code Outline)
-- ============================================================================

map("n", "<leader>a", "<cmd>AerialToggle<CR>", { desc = "Toggle outline" })
map("n", "<leader>fa", "<cmd>Telescope aerial<CR>", { desc = "Find symbols" })
map("n", "<leader>fn", "<cmd>AerialNavToggle<CR>", { desc = "Toggle Aerial nav" })

-- ============================================================================
-- DAP (Debugging)
-- ============================================================================

map("n", "<F9>", "<cmd>DapToggleBreakpoint<CR>", { desc = "DAP: Toggle breakpoint" })
map("n", "<F5>", "<cmd>DapContinue<CR>", { desc = "DAP: Start/Continue" })
map("n", "<F11>", "<cmd>DapStepInto<CR>", { desc = "DAP: Step into" })
map("n", "<F12>", "<cmd>DapStepOut<CR>", { desc = "DAP: Step out" })
map("n", "<F10>", "<cmd>DapStepOver<CR>", { desc = "DAP: Step over" })
map("n", "<S-F5>", "<cmd>DapTerminate<CR>", { desc = "DAP: Terminate" })
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", { desc = "DAP: Toggle UI" })
map("n", "<leader>dr", "<cmd>DapToggleRepl<CR>", { desc = "DAP: Toggle REPL" })
