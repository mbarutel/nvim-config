require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("i", "lu", "<ESC>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("x", "P", '"_dP', { desc = "Paste without yanking" })
map("n", "<leader>r", ':bufdo e', { desc = "reset all buffers opened" })

-- Panes
map("n", "|", ":vsplit<CR>", { desc = "Split pane vertically" })
map("n", "\\", ":split<CR>", { desc = "Split pane horizontally" })
map("n", "<leader>q", ":close<CR>", { desc = "Close pane" })

-- Navigating
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
map("n", "<C-down>", "<C-e>", { desc = "Scroll down" })
map("n", "<C-up>", "<C-y>", { desc = "Scroll up" })


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

-- Aerial mappings
map("n", "<leader>a", "<cmd>AerialToggle<CR>", { desc = "Toggle Aerial outline" })
map("n", "<leader>fa", "<cmd>Telescope aerial<CR>", { desc = "Find symbols with Telescope" })
map("n", "<leader>fn", "<cmd>AerialNavToggle<CR>", { desc = "Toggle Aerial navigation" })
