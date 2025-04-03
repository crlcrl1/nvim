local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not (vim.uv or vim.loop).fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            "--filter=blob:none",
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end

    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require('pckr').add {
    {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
    },
    {
        "crlcrl1/arctic.nvim",
        requires = { "rktjmp/lush.nvim" }
    },
    'rebelot/kanagawa.nvim',
    { 'bluz71/vim-moonfly-colors',       as = 'moonfly' },
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    { 'nvim-neotest/nvim-nio' },

    {
        'folke/noice.nvim',
        requires = 'rcarriga/nvim-notify'
    },
    {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("plugin-config/nvim-tree")
        end,
        -- cond = keys('n', '<A-e>')
    },
    {
        'JMarkin/nvim-tree.lua-float-preview',
        -- cond = keys('n', '<A-e>')
    },
    'jiangmiao/auto-pairs',
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    'HiPhish/rainbow-delimiters.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'voldikss/vim-floaterm',
    {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    },
    'honza/vim-snippets',
    'MunifTanjim/nui.nvim',

    'nvim-treesitter/nvim-treesitter-context',
    'liuchengxu/vista.vim',
    'goolord/alpha-nvim',
    'ahmedkhalf/project.nvim',
    'numToStr/Comment.nvim',
    'dhruvasagar/vim-table-mode',
    {
        'neoclide/coc.nvim',
        branch = 'release'
    },
    'vim-scripts/DoxygenToolkit.vim',
    'norcalli/nvim-colorizer.lua',
    'awelormro/Todo-highlight.vim',
    'tpope/vim-surround',
    'tpope/vim-fugitive',
    'gcmt/wildfire.vim',
    'github/copilot.vim',
    'makerj/vim-pdf',
    'skywind3000/asyncrun.vim',
    { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' },
    'ethanholz/nvim-lastplace',
    'abecodes/tabout.nvim',
    -- use 'luukvbaal/statuscol.nvim'
    {
        "utilyre/sentiment.nvim",
        tag = "*",
    },
    'tribela/vim-transparent',
    'CopilotC-Nvim/CopilotChat.nvim',

    -- Debuggers
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
    'LiadOz/nvim-dap-repl-highlights',
    {
        'stevearc/overseer.nvim',
        requires = 'stevearc/dressing.nvim',
        config = function()
            require("plugin-config/overseer")
        end
    },
    {
        'amitds1997/remote-nvim.nvim',
        requires = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim', 'nvim-telescope/telescope.nvim' }
    }
}
