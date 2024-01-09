return {
  { 'rose-pine/neovim', name = 'rose-pine' },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  'mbbill/undotree',           -- Undo tree
  'nvim-lualine/lualine.nvim', -- Statusline
  'nvim-lua/plenary.nvim',     -- Common utilities
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  'nvim-treesitter/nvim-treesitter-context',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  { 'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  },
  'norcalli/nvim-colorizer.lua',
  'akinsho/nvim-bufferline.lua',
  'lewis6991/gitsigns.nvim',
  'folke/zen-mode.nvim',
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  -- Language tools
  'simrat39/rust-tools.nvim',
  'prettier/vim-prettier',
  'github/copilot.vim',
  'ray-x/go.nvim',
}