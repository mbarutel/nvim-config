require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("i", "lu", "<ESC>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("x", "P", '"_dP', { desc = "Paste without yanking" })

-- Panes
map("n", "|", ':vsplit<CR>', { desc = "Split pane vertically" })
map("n", "\\", ':split<CR>', { desc = "Split pane horizontally" })
map("n", "<leader>q", ':close<CR>', { desc = "Close pane" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- LSP
map("n", "<leader>ld", function()
  vim.diagnostic.open_float(nil, {
    scope = "line",
  })
end, { desc = "Show line diagnostics" })
