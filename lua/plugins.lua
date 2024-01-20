-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
    use {
        "rockyzhang24/arctic.nvim",
        requires = { "rktjmp/lush.nvim" }
    }
    use "rebelot/kanagawa.nvim"
    use { "bluz71/vim-moonfly-colors", as = 'moonfly' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'jiangmiao/auto-pairs'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'HiPhish/rainbow-delimiters.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'voldikss/vim-floaterm'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'honza/vim-snippets'
    -- use 'rcarriga/nvim-notify'
    use 'MunifTanjim/nui.nvim'
    -- use 'folke/noice.nvim'

    use 'nvim-treesitter/nvim-treesitter-context'
    use 'liuchengxu/vista.vim'
    use 'goolord/alpha-nvim'
    -- use 'glepnir/dashboard-nvim'
    use 'ahmedkhalf/project.nvim'
    use 'preservim/nerdcommenter'
    use 'dhruvasagar/vim-table-mode'
    use 'petertriho/nvim-scrollbar'
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
end)
