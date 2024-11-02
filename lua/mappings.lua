require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")


-- Tmux mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<c-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<c-j>", "<cmd> TmuxNavigateDown<CR>")
map("n", "<c-k>", "<cmd> TmuxNavigateUp<CR>")
map("n", "<c-l>", "<cmd> TmuxNavigateRight<CR>")

-- ToggleTerm mappings terminal
-- map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- New terminals
-- map(
--   "n",
--   "<leader>hh",
--   "<cmd>ToggleTerm direction=horizontal size=8 <CR>",
--   { desc = "terminal new horizontal term", noremap = true, silent = true }
-- )
-- map(
--   "n",
--   "<leader>vv",
--   "<cmd>ToggleTerm direction=vertical size=60 <CR>",
--   { desc = "terminal new vertical term", noremap = true, silent = true }
-- )
--
-- -- Toggleable terminals
-- map(
--   { "n", "t" },
--   "<leader>tt",
--   "<cmd>ToggleTerm direction=float<CR>",
--   { desc = "terminal toggle floating term", noremap = true, silent = true }
-- )
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- DAP mappings
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dus", function()
  local widgets = require("dap.ui.widgets")
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Opens the debug sidebar" })
map("n", "<leader>dgt", function ()
  require("dap-go").debug_test()
end, { desc = "Debug go test" })

map("n", "<leader>dgl", function ()
  require("dap-go").debug_last()
end, { desc = "Debug last go test" })
