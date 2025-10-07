require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("i", "lu", "<ESC>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("x", "P", '"_dP', { desc = "Paste without yanking" })

-- Panes
map("n", "|", ":vsplit<CR>", { desc = "Split pane vertically" })
map("n", "\\", ":split<CR>", { desc = "Split pane horizontally" })
map("n", "<leader>q", ":close<CR>", { desc = "Close pane" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- LSP
map("n", "<leader>ld", function()
  vim.diagnostic.open_float(nil, {
    scope = "line",
  })
end, { desc = "Show line diagnostics" })

map("n", "<leader>m", function()
  if vim.t.maximized then
    vim.cmd "wincmd =" -- This is to restore all sizes
    vim.t.maximized = false
  else
    vim.cmd "wincmd |"
    vim.cmd "wincmd _"
    vim.t.maximized = true
  end
end, { desc = "Turn a pane into full screen" })
