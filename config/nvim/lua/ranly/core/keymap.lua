vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap

-- options
local opt = { noremap = true, silent = true }
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
map("n", "<A-n>", ":set nu! rnu!<CR>", opt)

-- buffer move
map("n", "<A-b>l", ":bnext<CR>", opt)
map("n", "<A-b>h", ":bprevious<CR>", opt)

-- reload lua
map("n", "<A-r>", ":luafile %<CR>", opt)

-- tab
map("n", "<Tab>", ">>_", opt)
map("n", "<S-Tab>", "<<_", opt)
map("i", "<S-Tab>", "<C-D>", opt)
map("v", "<Tab>", ">gv", opt)
map("v", "<S-Tab>", "<gv", opt)