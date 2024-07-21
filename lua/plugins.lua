-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
    use {
        "crlcrl1/arctic.nvim",
        requires = { "rktjmp/lush.nvim" }
    }
    use 'rebelot/kanagawa.nvim'
    use { 'bluz71/vim-moonfly-colors', as = 'moonfly' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-neotest/nvim-nio' }

    use {
        'folke/noice.nvim',
        requires = 'rcarriga/nvim-notify'
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'JMarkin/nvim-tree.lua-float-preview'
    use 'jiangmiao/auto-pairs'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'HiPhish/rainbow-delimiters.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'voldikss/vim-floaterm'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'honza/vim-snippets'
    use 'MunifTanjim/nui.nvim'

    use 'nvim-treesitter/nvim-treesitter-context'
    use 'liuchengxu/vista.vim'
    use 'goolord/alpha-nvim'
    use 'ahmedkhalf/project.nvim'
    use 'numToStr/Comment.nvim'
    use 'dhruvasagar/vim-table-mode'
    use {
        'neoclide/coc.nvim',
        branch = 'release'
    }
    use 'vim-scripts/DoxygenToolkit.vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'awelormro/Todo-highlight.vim'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'gcmt/wildfire.vim'
    use 'github/copilot.vim'
    use 'makerj/vim-pdf'
    use 'skywind3000/asyncrun.vim'
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use 'ethanholz/nvim-lastplace'
    use 'abecodes/tabout.nvim'
    -- use 'luukvbaal/statuscol.nvim'
    use {
        "utilyre/sentiment.nvim",
        tag = "*",
    }
    use 'tribela/vim-transparent'
    use 'CopilotC-Nvim/CopilotChat.nvim'

    -- Debuggers
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'LiadOz/nvim-dap-repl-highlights'
    use {
        'stevearc/overseer.nvim',
        requires = 'stevearc/dressing.nvim',
    }
end)
