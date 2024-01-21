vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-e>', ':NvimTreeToggle<CR>', opts)
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
map("n", "<F10>", ":FloatermKill<CR>", opts)

map("n", "<A-l>", "<C-w>l", opts)
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-.>", "<C-w>>", opts)
map("n", "<A-,>", "<C-w><", opts)

map('n', '<C-u>', ':nohlsearch<CR>', opts)

map('n', '<A-f>', ':Telescope find_files<CR>', opts)

map('n', '<C-q>', ':bw!<CR>', opts)
