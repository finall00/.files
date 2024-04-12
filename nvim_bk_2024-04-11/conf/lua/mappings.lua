require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map({"i", "v"}, "<leader>;", "<ESC>")
map({"n", "i","v"}, "<C-r>n", "<cmd>set invrelativenumber <cr>")

-- Save
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map({"n", "i"}, "<C-z>", "<cmd> u <cr>")
