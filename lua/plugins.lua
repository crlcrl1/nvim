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
local event = require('pckr.loader.event')

require('pckr').add {
    {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("plugin-config/bufferline")
        end
    },
    {
        "crlcrl1/arctic.nvim",
        requires = { "rktjmp/lush.nvim" }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        requires = { 'nvim-treesitter/nvim-treesitter-context' },
        run = ':TSUpdate',
        config = function()
            require("plugin-config/nvim-treesitter")
            require("plugin-config/context")
        end,

    },
    'nvim-neotest/nvim-nio',
    {
        'folke/noice.nvim',
        requires = 'rcarriga/nvim-notify',
        config = function()
            require("plugin-config/notify")
            require("plugin-config/noice")
        end
    },
    {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', 'JMarkin/nvim-tree.lua-float-preview' },
        config = function()
            require("plugin-config/nvim-tree")
        end,
    },
    'jiangmiao/auto-pairs',
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require("plugin-config/lualine")
        end
    },
    'HiPhish/rainbow-delimiters.nvim',
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("plugin-config/indent-blankline")
        end,
        cond = event("BufEnter"),
    },
    {
        'EmilOhlsson/FloatTerm.nvim',
        config = function()
            require("plugin-config/float-term")
        end,
        cond = keys('n', '<F12>')
    },
    {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("plugin-config/telescope")
        end
    },
    {
        'honza/vim-snippets',
        cond = event("BufEnter"),
    },
    'MunifTanjim/nui.nvim',
    {
        'liuchengxu/vista.vim',
        cond = cmd('Vista'),
    },
    {
        'goolord/alpha-nvim',
        config = function()
            require("plugin-config/alpha")
        end
    },
    {
        'ahmedkhalf/project.nvim',
        config = function()
            require("plugin-config/project")
        end
    },
    {
        'dhruvasagar/vim-table-mode',
        cond = cmd('TableModeToggle'),
    },
    {
        'neoclide/coc.nvim',
        config = function()
            require("plugin-config/coc")
        end,
        branch = 'release',
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("colorizer").setup()
        end,
        cond = event({ "BufEnter", "BufRead" })
    },
    {
        'awelormro/Todo-highlight.vim',
        cond = event({ "BufEnter", "BufRead" }),
    },
    {
        'tpope/vim-surround',
        cond = event("BufEnter"),
    },
    'gcmt/wildfire.vim',
    {
        'github/copilot.vim',
        config = function()
            vim.cmd("silent! Copilot")
        end,
        cond = event("InsertEnter"),
    },
    {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async',
        config = function()
            require("plugin-config/ufo")
        end,
        cond = event("BufEnter"),
    },
    {
        'ethanholz/nvim-lastplace',
        config = function()
            require("nvim-lastplace").setup()
        end,
        cond = event("BufReadPost")
    },
    {
        'abecodes/tabout.nvim',
        config = function()
            require("plugin-config/tabout")
        end,
        cond = event("BufEnter"),
    },
    {
        "utilyre/sentiment.nvim",
        tag = "*",
        config = function()
            require("sentiment").setup()
        end
    },
    'tribela/vim-transparent',
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        config = function()
            require("plugin-config/copilot-chat")
        end,
        cond = cmd("CopilotChatToggle")
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require("plugin-config/comment")
        end
    },
    {
        'mfussenegger/nvim-dap',
        requires = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
            'nvim-telescope/telescope-dap.nvim',
            'LiadOz/nvim-dap-repl-highlights',
        },
        config = function()
            require("debuggers/dap")
            require("debuggers/cpp")
            require("debuggers/go")
            require("debuggers/ui")
            require("debuggers/python")
            require("debuggers/java")
            require("nvim-dap-repl-highlights").setup()
        end,
        cond = event({ "BufNewFile", "BufRead" })
    },
    {
        'stevearc/overseer.nvim',
        requires = 'stevearc/dressing.nvim',
        config = function()
            require("plugin-config/overseer")
        end,
        cond = event({ "BufNewFile", "BufRead" })
    },
    {
        'amitds1997/remote-nvim.nvim',
        requires = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim', 'nvim-telescope/telescope.nvim' },
        config = function()
            require("plugin-config/remote")
        end
    },
    {
        'dstein64/vim-startuptime',
        cond = cmd('StartupTime'),
    }
}
