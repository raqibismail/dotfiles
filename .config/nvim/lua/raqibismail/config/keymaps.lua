vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, opts)

-- Better movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<leader>af", "gg=G", opts)

-- Save and Quit
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Stay in indent mode when using > or <
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down (like VS Code Alt+Up/Down)
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- The "Keep Clipboard" Paste
-- This lets you paste over something without losing your copied text
keymap("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })

-- Yank to system clipboard (Standard for most Linux users)
keymap({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
keymap("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Delete to void register (Doesn't overwrite what you copied)
keymap({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without saving to register" })
