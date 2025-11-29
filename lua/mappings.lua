require "nvchad.mappings"

local map = vim.keymap.set

-- ============================================================================
-- General Mappings
-- ============================================================================

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "<C-s>", "<ESC>:w<CR>", { desc = "Activate normal mode and save" })
map("x", "P", '"_dP', { desc = "Paste without yanking" })
map("n", "<leader>r", ":bufdo e<CR>", { desc = "Reload all buffers" })

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

-- ============================================================================
-- Aerial (Code Outline)
-- ============================================================================

map("n", "<leader>a", "<cmd>AerialToggle<CR>", { desc = "Toggle outline" })
map("n", "<leader>fa", "<cmd>Telescope aerial<CR>", { desc = "Find symbols" })
map("n", "<leader>fn", "<cmd>AerialNavToggle<CR>", { desc = "Toggle Aerial nav" })

-- ============================================================================
-- DAP (Debugging)
-- ============================================================================

map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "DAP: Toggle breakpoint" })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "DAP: Start/Continue" })
map("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "DAP: Step into" })
map("n", "<leader>do", "<cmd>DapStepOut<CR>", { desc = "DAP: Step out" })
map("n", "<leader>ds", "<cmd>DapStepOver<CR>", { desc = "DAP: Step over" })
map("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "DAP: Terminate" })
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", { desc = "DAP: Toggle UI" })
map("n", "<leader>dr", "<cmd>DapToggleRepl<CR>", { desc = "DAP: Toggle REPL" })
