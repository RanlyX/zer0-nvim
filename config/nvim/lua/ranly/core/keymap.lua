vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap

-- options
local opt = { noremap = true, silent = true }

-- reload lua
map("n", "<A-r>", ":luafile %<CR>", opt)