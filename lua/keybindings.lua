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


map(
    'n',
    'Q',
    ":lua require'dap'.close()<CR>"
    .. ":lua require'dap'.terminate()<CR>"
    .. ":lua require'dap.repl'.close()<CR>"
    .. ":lua require'dapui'.close()<CR>",
    opts
)
-- Start or continue debugging
map('n', '<F5>', ":lua require'dap'.continue()<CR>", opts)
-- Toggle breakpoint
map('n', '<F6>', ":lua require'dap'.toggle_breakpoint()<CR>", opts)
--  stepOver, stepOut, stepInto
map('n', '<F2>', ":lua require'dap'.step_over()<CR>", opts)
map('n', '<F4>', ":lua require'dap'.step_out()<CR>", opts)
map('n', '<F3>', ":lua require'dap'.step_into()<CR>", opts)
-- Check variables
map('n', '<Leader>E', ":lua require'dapui'.eval()<CR>", opts)
map('n', '<C-c>', ":lua require('dap').run_to_cursor()<CR>", opts)

-- Set conditional breakpoint
map('n', '<Leader>b', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
-- Restart
map('n', '<A-r>', ":lua require'dap'.restart()<CR>", opts)

map('n', '<A-c>', ':CopilotChatToggle<CR>', opts)

map('n', '<Leader>ot', ':OverseerToggle<CR>', opts)
map('n', '<Leader>or', ':OverseerRun<CR>', opts)

-- Floaterm
-- map('n', '<F12>', ':FloatermToggle<CR>', opts)

-- save
map('n', '<C-s>', ':w<CR>', opts)
map("i", "<C-s>", "<Esc>:w<CR>i", opts)


-- table mode
map('n', '<Leader>tm', ':TableModeToggle<CR>', opts)
