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

local pluginKeys = {}

map('n', '<C-u>', ':nohlsearch<CR>', opts)

map('n', '<A-f>', ':Telescope find_files<CR>', opts)

map('n', '<C-q>', ':bw!<CR>', opts)
