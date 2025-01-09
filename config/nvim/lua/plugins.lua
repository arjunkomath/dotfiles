return {
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
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  },
  'norcalli/nvim-colorizer.lua',
  'akinsho/nvim-bufferline.lua',
  'lewis6991/gitsigns.nvim',
  {
    'f-person/git-blame.nvim',
    config = function()
      require('gitblame').setup()
    end
  },
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
  'nvim-pack/nvim-spectre',
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  -- Language tools
  'simrat39/rust-tools.nvim',
  'prettier/vim-prettier',
  'github/copilot.vim',
  'ray-x/go.nvim',
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {}
  },
  -- {
  --   'jesseleite/nvim-noirbuddy',
  --   dependencies = {
  --     { 'tjdevries/colorbuddy.nvim' }
  --   },
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     -- All of your `setup(opts)` will go here
  --   },
  --   config = function()
  --     require('noirbuddy').setup {
  --       preset = 'miami-nights',
  --     }
  --   end
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       styles = {
  --         comments = { italic = false },
  --         keywords = { italic = false },
  --         functions = { italic = false },
  --         variables = { italic = false },
  --       },
  --       on_highlights = function(hl, c)
  --         hl.Normal = { bg = "#000000" }
  --       end
  --     })
  --     vim.cmd [[colorscheme tokyonight]]
  --   end,
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        styles = {
          italic = false,
        },
        highlight_groups = {
          Normal = { bg = "#000000" }
        }
      })
      vim.cmd("colorscheme rose-pine")
    end
  }
}
