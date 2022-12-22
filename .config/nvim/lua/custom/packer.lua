-- This file can be loaded by calling `lua require('packer')` from your init.vim
--
--

vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
          -- or                            , branch = '0.1.x',
          requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- treesitter
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

    -- Autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp'
            , 'L3MON4D3/LuaSnip'
            , 'saadparwaiz1/cmp_luasnip' },
    }
end
)

